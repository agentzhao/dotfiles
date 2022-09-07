-- local lspconfig = require("lspconfig")
--
-- -- null-ls
-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       -- apply whatever logic you want (in this example, we'll only use null-ls)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end
--
-- -- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- null-ls -- uncomment when upgrading to 0.8
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         lsp_formatting(bufnr)
--       end,
--     })
--   end
--
--   -- local no_nullls = {
--   --   "html",
--   --   "tsserver",
--   --   "volar",
--   --   "jsonls",
--   -- }
--   --
--   -- for _, name in ipairs(no_nullls) do
--   --   if client.name == name then
--   --     client.server_capabilities.document_formatting = false
--   --   end
--   -- end
--
--   -- document-color.nvim
--   if client.server_capabilities.colorProvider then
--     -- Attach document colour support
--     require("document-color").buf_attach(bufnr)
--   end
--
--   local function buf_set_keymap(...)
--     vim.api.nvim_buf_set_keymap(bufnr, ...)
--   end
--
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--
--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--
--   -- Mappings.
--   local opts = { noremap = true, silent = true }
--
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--   buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--   buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
--   buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--   buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--   buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--   buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--   buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
--   buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
--   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--
--   -- trouble.nvim
--   buf_set_keymap("n", "<space>xx", "<cmd>Trouble<CR>", opts)
--   buf_set_keymap("n", "<space>xw", "<cmd>Trouble lsp_workspace_diagnostics<CR>", opts)
--   buf_set_keymap("n", "<space>xd", "<cmd>Trouble lsp_document_diagnostics<CR>", opts)
--   buf_set_keymap("n", "<space>xl", "<cmd>Trouble loclist<CR>", opts)
--   buf_set_keymap("n", "<space>xq", "<cmd>Trouble quickfix<CR>", opts)
--   buf_set_keymap("n", "gR", "<cmd>Trouble lsp_references<CR>", opts)
-- end

local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
  vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
  return
end

local servers = {
  -- LSP
  "arduino_language_server",
  "bashls",
  "clangd",
  "cssls",
  "dockerls",
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
  "volar",
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

  -- Formatters
  "black",
  "prettier",
  "shfmt",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, name in ipairs(servers) do
  local ok, server = require('lspconfig')[name].setup {}
end

-- document-color.nvim
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- You are now capable!
capabilities.textDocument.colorProvider = true

-- Lsp servers that support documentColor
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
-- require("mason-lspconfig").setup_handlers {
--     -- default handler - setup with default settings
--     function (server_name)
--         lspconfig[server_name].setup {}
--     end,
--    -- you can override the default handler by providing custom handlers per server
--    ["jdtls"] = function ()
--        // do something with the nvim-jdtls plugin instead
--    end
-- }
