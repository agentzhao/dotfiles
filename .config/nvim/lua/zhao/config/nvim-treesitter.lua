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
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = {
    enable = true,
    disable = {},
  },
})
