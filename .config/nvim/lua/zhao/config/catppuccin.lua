-- remember to comment/uncomment special integration in lualine config

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  flavour = "mocha", -- "latte", "frappe", "macchiato", "mocha"
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
  default_integrations = true,
  integrations = {
    aerial = true,
    barbar = true,
    beacon = true,
    gitsigns = true,
    leap = true,
    mason = true,
    cmp = true,
    notify = true,
    nvimtree = true,
    treesitter_context = true,
    treesitter = true,
    ts_rainbow = true,
    lsp_trouble = true,
    gitgutter = true,
    which_key = true,
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
