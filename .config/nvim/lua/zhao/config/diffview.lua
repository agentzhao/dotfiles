local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "dvo", ":DiffviewOpen<CR>", opts)
map("n", "dvc", ":DiffviewClose<CR>", opts)
