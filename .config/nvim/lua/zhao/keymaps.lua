local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true }
local opts2 = { noremap = true, silent = true }
local opts3 = { noremap = true, expr = true }

map("n", "<C-c>", "<Esc>", opts)
-- map("x", "i", "<C-c>i", opts)
map("n", "<leader>cd", ":cd %:p:h<CR>", opts)
map("n", "<leader>gb", "<c-^>", opts)

map("n", "<C-s>", "<C-u>", opts) -- <C-s> to scroll up and <C-d> to scroll down
map("x", "<leader>p", "\"_dP", opts) -- paste over selection
map("n", "<C-4>", "<Nop>", opts) -- why does C-4 open toggleterm
map("n", "<CR>", "o<ESC>", opts) -- <CR> add new line below

map("n", "J", "mzJ`z", opts) -- join lines

map("n", "n", "nzzzv", opts) -- keep cursor in the middle when searching
map("n", "N", "Nzzzv", opts) -- also backwards

-- quickfix
map("n", "<leader>k", "<cmd>lnext<CR>", opts) -- next quickfix
map("n", "<leader>j", "<cmd>lprev<CR>", opts) -- previous quickfix
-- Deleting empty lines in normal/visual mode
local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end

-- Delete all empty lines
map("n", "<Leader>del", ":g/^$/d | noh<CR>", opts)

-- Don't keep empty lines in register
vim.keymap.set("n", "dd", smart_dd, opts3)
vim.keymap.set("v", "d", smart_dd, opts3)

-- Delete word by word
map("i", "<M-BS>", "<C-w>", opts)
map("i", "<M-d>", "<cmd>norm! dw<CR>", opts)

-- Window navigation :ball :vert ball
map("n", "<M-k>", ":wincmd k<CR>", opts)
map("n", "<M-j>", ":wincmd j<CR>", opts)
map("n", "<M-h>", ":wincmd h<CR>", opts)
map("n", "<M-l>", ":wincmd l<CR>", opts)

-- Sessions
map("n", "<Leader>ss", ":<C-u>SaveSession<CR>", {})
map("n", "<Leader>rs", ":<C-u>RestoreSession<CR>", {})
map("n", "<Leader>sl", ":<C-u>SearchSession<CR>", {})

map("n", "<A-w>", "<cmd>WinShift<cr>", opts)

--Telescope
map("n", "<leader>pp", "<cmd>Telescope projects<cr>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", opts)
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", opts)
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

-- LightSpeed.nvim
-- map("n", "s", "<Plug>Lightspeed_omni_s", {})

-- Snippets
map("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
map("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- Debugging
map("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
map("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
map("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)
map("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
map("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
map("n", "<F9>", ":lua require('dap').continue()<CR>", opts)

map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)

map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map(
  "n",
  "<Leader>dbm",
  ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
  opts
)
map("n", "<Leader>dbp", ":lua require('dap').toggle_breakpoint()<CR>", opts)

map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)

-- barbar
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts2)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts2)
-- map("n", "<C-Left>", ":tabprevious<CR>", opts2)
-- map("n", "<C-Right>", ":tabnext<CR>", opts2)
-- map("n", "<C-t>", ":tabnew<CR>", opts2)
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts2)
-- map("n", "<C-w>", ":tabclose<CR>", opts2)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts2) -- Magic buffer-picking mode
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts2)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts2)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts2)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts2)

-- LazyGit
map("n", "<leader>gg", ":LazyGit<CR>", opts2)
