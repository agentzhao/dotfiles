-- Here is the formatting config
local null_ls = require("null-ls")

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

local lssources = {
  -- formatting
  formatter.eslint_d,
  formatter.prettier,
  formatter.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
  formatter.black.with({ extra_args = { "--fast" } }), --python
  formatter.rustywind, -- tailwindcss

  -- null_ls.builtins.formatting.cmake_format, --foramt listfiiles
  -- null_ls.builtins.formatting.codespell, --common misspellings in text files
  -- null_ls.builtins.formatting.eslint_d, --eslint but faster
  -- null_ls.builtins.formatting.fixjson, --JSON file fixer/formatter for humans using (relaxed) JSONS
  -- null_ls.builtins.formatting.json_tool, --cli to validate and pretty print JSON objects
  -- null_ls.builtins.formatting.gofmt, -- format go programs
  -- null_ls.builtins.diagnostics.golangci_lint, --go linter aggregator
  -- null_ls.builtins.formatting.google_java_format,
  -- null_ls.builtins.formatting.isort, --python sort imports alphabetically
  -- null_ls.builtins.diagnostics.mypy, -- static type checker for python
  -- null_ls.builtins.diagnostics.pylint, --static analysis of python
  -- null_ls.builtins.formatting.latexindent, --perl script for formatting LaTeX
  -- null_ls.builtins.formatting.nginx_beautifier, -- nginx
  -- null_ls.builtins.diagnostics.php, --php syntax error
  -- null_ls.builtins.formatting.phpcsfixer, -- formatter for php
  -- null_ls.builtins.formatting.rustfmt, -- rust
  -- null_ls.builtins.formatting.shfmt, -- shell/bash
  -- null_ls.builtins.formatting.sqlformat, --sql
  -- null_ls.builtins.formatting.stylelint, -- css/scss/sass/less
  -- null_ls.builtins.formatting.uncrustify, --C, C++, C#, ObjectiveC, D, java, pawn and VALA
  -- null_ls.builtins.diagnostics.codespell, --spell checker for text files

  -- diagnostics
  diagnostics.eslint_d, -- eslint but faster
  diagnostics.shellcheck, -- bash/sh shell scripts
  diagnostics.cppcheck, --fast static analysis of C/C++ code
}

-- Format files on save
require("null-ls").setup({
  sources = lssources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
