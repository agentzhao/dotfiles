local ignored_filetypes = { 'NvimTree', 'lazygit', 'toggleterm' }

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "astro",
    "bash",
    "c",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "jsonc",
    "latex",
    "lua",
    "markdown",
    -- "php",
    "python",
    "rust",
    "regex",
    "rust",
    "scss",
    "sql",
    "typescript",
    "vue",
    "yaml",
  },
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = ignored_filetypes,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    disable = ignored_filetypes,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = {
    enable = true,
    disable = {},
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      disable = ignored_filetypes,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
      },
    },
  }
})
