-- https://ithub.com/nanotee/nvim-lua-guide
--vim.o: behaves like :set
--vim.go: behaves like :setglobal
--vim.bo: behaves like :setlocal for buffer-local options
--vim.wo: behaves like :setlocal for window-local options
vim.g.mapleader = "," -- using comma as leader

-- Tabs
vim.cmd([[
set smartindent
set tabstop=2
set termguicolors
]])
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.opt.encoding = "UTF-8"
vim.opt.shortmess:append({ c = true })
vim.opt.inccommand = "nosplit"

-- Number on side bar
vim.wo.number = true
vim.wo.relativenumber = true

vim.bo.autoindent = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

vim.o.smarttab = true
vim.o.mouse = "a"
-- vim.o.autochdir = true
vim.o.clipboard = "unnamedplus"

vim.cmd("set backspace=indent,eol,start")
-- :noh to clear search highlighting

vim.opt.list = true
--vim.opt.listchars:append("eol:↴")
--
-- auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- -- coc nvim
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.updatetime = 500

-- lightspeed default highlighting
vim.cmd([[
autocmd ColorScheme * lua require'lightspeed'.init_highlight(true)
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])

-- auto session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- nvim-notify
vim.notify = require("notify")

-- Glow
vim.g.glow_border = "rounded"
