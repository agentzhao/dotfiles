require('nvim-tundra').setup({
  transparent_background = false,
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    gitsigns = true,
    telescope = true,
  },
})

vim.opt.background = 'dark'
vim.cmd('colorscheme tundra')
