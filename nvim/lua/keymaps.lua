local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true }

map('n', '<C-c>', '<Esc>', opts)
--map('v', '<i>', '<Esc>i', opts)

map('n', '<leader>cd', ':cd %:p:h<CR>', opts)

-- Delete word
map('i', '<M-BS>', '<C-w>', opts)
map('i', '<M-d>', '<cmd>norm! dw<CR>', opts)

-- Window navigation :ball :vert ball
map('n', '<A-Up>', ':wincmd k<CR>', {})
map('n', '<A-Down>', ':wincmd j<CR>', {})
map('n', '<A-Left>', ':wincmd h<CR>', {})
map('n', '<A-Right>', ':wincmd l<CR>', {})

-- Tabs
map('n', '<C-Left>', ':tabprevious<CR>', opts)
map('n', '<C-Right>', ':tabnext<CR>', opts)
map('n', '<C-w>', ':tabclose<CR>', opts)

-- Sessions
map('n', '<Leader>ss', ':<C-u>SessionSave<CR>', {})
map('n', '<Leader>sl', ':<C-u>SessionLoad<CR>', {})

--Telescope
map('n', '<leader>pp', '<cmd>Telescope projects<cr>', opts)
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
