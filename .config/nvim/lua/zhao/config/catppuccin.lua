-- remember to comment/uncomment special integration in lualine config

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  transparent_background = true,
  term_colors = false,
  compile = {
    enabled = false,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    "aerial",
    "barbar",
    "beacon",
    "gitsigns",
    "leap",
    "mason",
    "cmp",
    "notify",
    "nvimtree",
    "treesitter_context",
    "treesitter",
    "ts_rainbow",
    "telescope",
    "lsp_trouble",
    "gitgutter",
    "which_key",
  },
  color_overrides = {},
  highlight_overrides = {},

  -- special integrations
  indent_blankline = {
    enabled = true,
    colored_indent_levels = false,
  },
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
    },
    underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
    },
  },
})

vim.cmd [[colorscheme catppuccin]]
