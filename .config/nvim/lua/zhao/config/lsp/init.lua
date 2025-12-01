-- null-ls
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- null-ls -- 0.8 update
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  -- document-color.nvim
  if client.server_capabilities.colorProvider then
    -- Attach document colour support
    require("document-color").buf_attach(bufnr)
  end

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- <C-c>
  buf_set_keymap("n", "<C-c>", "<Esc>", opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- todo: temporary commented out for conform.nvim
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- trouble.nvim

  buf_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",
    { noremap = true, silent = true, desc = "Diagnostics (Trouble)" })
  buf_set_keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" })
  buf_set_keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>",
    { noremap = true, silent = true, desc = "Symbols (Trouble)" })
  buf_set_keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
    { noremap = true, silent = true, desc = "LSP Definitions / references / ... (Trouble)" })
  buf_set_keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>",
    { noremap = true, silent = true, desc = "Location List (Trouble)" })
  buf_set_keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>",
    { noremap = true, silent = true, desc = "Quickfix List (Trouble)" })
  buf_set_keymap("n", "gR", "<cmd>Telescope lsp_references<CR>",
    { noremap = true, silent = true, desc = "LSP References" })
end

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.colorProvider = {
  dynamicRegistration = true
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = "utf-8"
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

vim.diagnostic.enable(bufnr)

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
