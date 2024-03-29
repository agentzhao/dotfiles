local util = require("lspconfig.util")
local lsp = require("config/lsp")

local lsp_servers = {
  "arduino_language_server",
  -- "asm_lsp",
  "bashls",
  -- "ccls",
  "clangd",
  "cssls",
  -- "dartls",
  "dockerls",
  --"efm",
  "gopls",
  "html",
  "jsonls",
  "jdtls",
  "lemminx",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "marksman", -- Markdown
  "tailwindcss",
  "tsserver",
  --"powershell_es",
  --"sqlls",
  "volar",
  "yamlls",
}

for _, name in ipairs(lsp_servers) do
  local ok, server = require("nvim-lsp-installer.servers").get_server(name)

  if ok and not server:is_installed() then
    print("Installing LSP server " .. name)
    server:install()
  end
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
  max_conurrent_installers = 4,
})

local null_ls_formatting = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local servers = {
  jsonls = {
    on_attach = null_ls_formatting,
  },
  volar = {
    on_attach = null_ls_formatting,
  },
  html = {
    on_attach = null_ls_formatting,
  },
  tsserver = {
    root_dir = util.root_pattern("package.json"),
    on_attach = function(client, bufnr)
      null_ls_formatting(client)
      lsp.on_attach(client, bufnr)
    end,
  },
  rust_analyzer = {
    on_attach = function(client, bufnr)
      null_ls_formatting(client)
      lsp.on_attach(client, bufnr)
    end,
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    },
  },
}

local set_server_option = function(server, opt, opts)
  if servers[server] ~= nil and servers[server][opt] ~= nil then
    opts[opt] = servers[server][opt]
  elseif lsp[opt] ~= nil then
    opts[opt] = lsp[opt]
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

  for _, opt in ipairs({ "settings", "on_attach", "root_dir" }) do
    set_server_option(server.name, opt, opts)
  end

  if server.name == "clangd" then
    opts.capabilities.offsetEncoding = { "utf-16" }
  end

  if server.name == "rust_analyzer" then
    local _, req_server = require("nvim-lsp-installer.servers").get_server(server.name)
    opts.server = {
      cmd = req_server._default_options.cmd,
      on_attach = opts.on_attach,
    }
    require("rust-tools").setup(opts)
  else
    server:setup(opts)
  end

  vim.cmd([[ do User LspAttachBuffers ]])
end)
