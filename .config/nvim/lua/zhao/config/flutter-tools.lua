require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
}
require("telescope").load_extension("flutter")

vim.keymap.set('n', '<leader>ft', '<cmd>Telescope flutter commands<CR>')
