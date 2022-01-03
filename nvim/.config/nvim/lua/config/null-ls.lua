-- Here is the formatting config
local null_ls = require("null-ls")

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local lssources = {
  -- formatting
  formatter.eslint_d,
  formatter.prettier,
  formatter.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
  formatter.black.with({ extra_args = { "--fast" } }), --python
  formatter.rustywind, -- tailwindcss
  -- formatter.uncrustify, --C, C++, C#, ObjectiveC, D, java, pawn and VALA

  -- null_ls.builtins.formatting.cmake_format, --foramt listfiiles
  -- null_ls.builtins.formatting.fixjson, --JSON file fixer/formatter for humans using (relaxed) JSONS
  -- null_ls.builtins.formatting.json_tool, --cli to validate and pretty print JSON objects
  -- null_ls.builtins.formatting.gofmt, -- format go programs
  -- null_ls.builtins.diagnostics.golangci_lint, --go linter aggregator
  -- null_ls.builtins.formatting.google_java_format,
  -- null_ls.builtins.formatting.latexindent, --perl script for formatting LaTeX
  -- null_ls.builtins.formatting.nginx_beautifier, -- nginx
  -- null_ls.builtins.diagnostics.php, --php syntax error
  -- null_ls.builtins.formatting.phpcsfixer, -- formatter for php
  -- null_ls.builtins.formatting.rustfmt, -- rust
  -- null_ls.builtins.formatting.shfmt, -- shell/bash
  -- null_ls.builtins.formatting.sqlformat, --sql
  -- null_ls.builtins.formatting.stylelint, -- css/scss/sass/less
  --
  -- diagnostics
  diagnostics.eslint_d, -- eslint but faster
  diagnostics.shellcheck, -- bash/sh shell scripts
  --diagnostics.cppcheck, --fast static analysis of C/C++ code

  -- Code actions
  actions.eslint_d, -- eslint but faster
  actions.gitsigns, -- git commit

  -- Completion
  completion.luasnip,

  -- If eslint config exists use eslint, else use prettier
  require("null-ls.helpers").conditional(function(utils)
    local has_eslint = utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")

    if has_eslint then
      return formatter.prettier.with({
        filetypes = {
          "vue",
          "css",
          "html",
          "yaml",
          "markdown",
          "json",
        },
        args = {
          "--stdin-filepath",
          "$FILENAME",
        },
      })
    else
      return formatter.prettier.with({
        filetypes = {
          "vue",
          "css",
          "html",
          "yaml",
          "markdown",
          "json",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        args = {
          "--stdin-filepath",
          "$FILENAME",
        },
      })
    end
  end),
}

-- Format files on save
null_ls.setup({
  sources = lssources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})