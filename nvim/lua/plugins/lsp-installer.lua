local servers = {
  "bashls",
  "ccls",
  --"clangd",
  "cssls",
  "dockerls",
  "efm",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "tsserver",
  "sumneko_lua",
  --"powershell_es",
  "pyright",
  --"sqlls",
  "tailwindcss",
  "vimls",
  "volar",
  "lemminx",
  "yamlls",
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")

-- Settings
lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  },
  max_conurrent_installers = 4,
})

local function make_server_ready(attach)
  lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.on_attach = attach

    -- for lua
    if server.name == "sumneko_lua" then
      -- only apply these settings for the "sumneko_lua" server
      opts.settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the 'vim', 'use' global
            globals = {'vim', 'use', 'require'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    end

    if server.name == "eslint" then
      opts.on_attach = function (client, bufnr)
        -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
        -- the resolved capabilities of the eslint server ourselves!
        client.resolved_capabilities.document_formatting = true
        on_attach(client, bufnr)
      end
      opts.settings = {
        format = { enable = true }, -- this will enable formatting
      }
    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end


-- Setup language servers
make_server_ready(on_attach)

-- Install servers
local lsp_installer_servers = require'nvim-lsp-installer.servers'

for _, server in ipairs(servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(server)
  if server_available then
    if not requested_server:is_installed() then
      -- Queue the server to be installed
      requested_server:install()
    end
  end
end