local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true }
local opts2 = { noremap = true, silent = true }

map("n", "<C-c>", "<Esc>", opts)
map("x", "i", "<C-c>i", opts)

map("n", "<leader>cd", ":cd %:p:h<CR>", opts)

map("n", "<leader>gb", "<c-^>", opts)

-- Delete word
map("i", "<M-BS>", "<C-w>", opts)
map("i", "<M-d>", "<cmd>norm! dw<CR>", opts)

-- Window navigation :ball :vert ball
map("n", "<A-Up>", ":wincmd k<CR>", {})
map("n", "<A-Down>", ":wincmd j<CR>", {})
map("n", "<A-Left>", ":wincmd h<CR>", {})
map("n", "<A-Right>", ":wincmd l<CR>", {})

-- Tabs
map("n", "<C-Left>", ":tabprevious<CR>", opts)
map("n", "<C-Right>", ":tabnext<CR>", opts)
map("n", "<C-t>", ":tabnew<CR>", opts)
map("n", "<C-w>", ":tabclose<CR>", opts)

-- Sessions
map("n", "<Leader>ss", ":<C-u>SaveSession<CR>", {})
map("n", "<Leader>rs", ":<C-u>RestoreSession<CR>", {})
map("n", "<Leader>sl", ":<C-u>SearchSession<CR>", {})

map("n", "<A-w>", "<cmd>WinShift<cr>", opts)

--Telescope
map("n", "<leader>pp", "<cmd>Telescope projects<cr>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

--copilot
--map('i', '<C-L>', '<cmd>copilot#Accept()<CR>', { silent = true })

-- Shift + J/K moves selected lines down/up in visual mode
map("x", "J", ":move '>+1<CR>zzgv-gv", opts2)
map("x", "K", ":move '<-2<CR>zzgv-gv", opts2)
--map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts2)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts2)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts2)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts2)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts2)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts2)
