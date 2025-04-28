local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
  vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
  return
end

local servers = {
  -- LSP
  "arduino_language_server",
  "astro",
  "bashls",
  "clangd", -- C/C++
  "cssls",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "jdtls",
  "ts_ls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "marksman", -- Markdown
  "tailwindcss",
  "texlab",
  "volar",
  "lemminx", -- XML
  "yamlls",
}

local others = {
  -- Debuggers
  "codelldb",
  "debugpy",
  "go-debug-adaper",
  "node-debug2-adapter",

  -- Linters
  "eslint_d",
  "pylint",

  -- Formatters
  "black",
  "prettier",
  "shfmt",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status_ok then
  vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
  return
end

local opts = {
  on_attach = require("zhao.config.lsp").on_attach,
  capabilities = require("zhao.config.lsp").capabilities,
}

-- disable formatting to use null_ls instead
local null_ls = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- Default handler (optional)
    lspconfig[server_name].setup {
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
    }
  end,

  -- You can also specify a handler for a specific server
  ["jdtls"] = function()
    lspconfig.jdtls.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git") or vim.fn.getcwd()
    })
  end,

  ["clangd"] = function()
    lspconfig.clangd.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      -- namespaceIndentation = true,
      cmd = { "clangd", '--background-index', '--clang-tidy' }
    })
  end,

  ["volar"] = function()
    lspconfig.volar.setup({
      on_attach = null_ls,
    })
  end,

  ["html"] = function()
    lspconfig.html.setup({
      on_attach = null_ls,
    })
  end,

  -- Next, you can provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require('rust-tools').setup(opts)
  end,


  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,

      settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
          diagnostics = {
            globals = { "vim" },
          },

          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,

  ["jsonls"] = function()
    -- Find more schemas here: https://www.schemastore.org/json/
    -- Schemas for common json files
    local schemas = {
      {
        description = "Schema for CMake Presets",
        fileMatch = {
          "CMakePresets.json",
          "CMakeUserPresets.json",
        },
        url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
      },
      {
        description = "LLVM compilation database",
        fileMatch = {
          "compile_commands.json",
        },
        url = "https://json.schemastore.org/compile-commands.json",
      },
      {
        description = "Config file for Command Task Runner",
        fileMatch = {
          "commands.json",
        },
        url = "https://json.schemastore.org/commands.json",
      },
      {
        description = "Json schema for properties json file for a GitHub Workflow template",
        fileMatch = {
          ".github/workflow-templates/**.properties.json",
        },
        url = "https://json.schemastore.org/github-workflow-template-properties.json",
      },
      {
        description = "JSON schema for Visual Studio component configuration files",
        fileMatch = {
          "*.vsconfig",
        },
        url = "https://json.schemastore.org/vsconfig.json",
      },
    }

    lspconfig.jsonls.setup({
      on_attach = null_ls,
      capabilities = opts.capabilities,

      settings = {
        json = {
          schemas = schemas,
        },
      },

      setup = {
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
            end,
          },
        },
      },
    })
  end,
})
