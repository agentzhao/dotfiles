-- install the sources on host machine
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

-- Here is the formatting config
local null_ls = require("null-ls")

-- Increase timeout for null-ls
vim.lsp.buf.format({ timeout_ms = 2000 })

local has_eslint = function(utils)
  -- root_has_file accepts multiple files now
  return utils.root_has_file({
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    "package.json",
  })
end

local lssources = {
  -- formatting
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }), --python
  null_ls.builtins.formatting.rustywind,                                 -- tailwindcss

  -- Completion
  null_ls.builtins.completion.luasnip,

  -- Actions
  null_ls.builtins.code_actions.gitsigns,

  -- Hover
  null_ls.builtins.hover.dictionary, -- definition of word
  null_ls.builtins.hover.printenv,   -- print environment variables

  -- If eslint config exists use eslint, else use prettier
  -- null_ls.builtins.formatting.eslint_d.with({
  --   condition = has_eslint,
  -- }),
  -- null_ls.builtins.diagnostics.eslint_d.with({
  --   condition = has_eslint,
  -- }),
  -- null_ls.builtins.code_actions.eslint_d.with({
  --   condition = has_eslint,
  -- }),
  require("none-ls.diagnostics.eslint_d"),
  require("none-ls.formatting.eslint_d"),
  require("none-ls.code_actions.eslint_d"),
  require("none-ls-shellcheck.diagnostics"),
  require("none-ls-shellcheck.code_actions"),
}

-- Format files on save
null_ls.setup({
  sources = lssources,
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
})
