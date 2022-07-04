-- Here is the formatting config
local null_ls = require("null-ls")

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

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
  formatter.prettier,
  -- formatter.stylua.with({
  --   args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  -- }),
  formatter.black.with({ extra_args = { "--fast" } }), --python
  formatter.rustywind, -- tailwindcss
  formatter.asmfmt, -- assembly
  formatter.shfmt, -- bash shell
  -- formatter.uncrustify, --C, C++, C#, ObjectiveC, D, java, pawn and VALA

  -- null_ls.builtins.formatting.cmake_format, --foramt listfiiles
  -- null_ls.builtins.formatting.gofmt, -- format go programs

  diagnostics.shellcheck, -- bash/sh shell scripts
  --diagnostics.cppcheck, --fast static analysis of C/C++ code

  -- Code actions
  actions.gitsigns, -- git commit

  -- Completion
  completion.luasnip,

  -- Hover
  hover.dictionary,

  -- If eslint config exists use eslint, else use prettier
  formatter.eslint_d.with({
    condition = has_eslint,
  }),
  diagnostics.eslint_d.with({
    condition = has_eslint,
  }),
  actions.eslint_d.with({
    condition = has_eslint,
  }),
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
