vim.g.mapleader = "," -- using comma as leader

-- Standard stuff
vim.opt.encoding     = "UTF-8"
vim.o.cursorline     = true -- highlight current line
vim.o.autoindent     = true
vim.o.showmatch      = true --show matching brackets
vim.o.number         = true --show line numbers
vim.o.relativenumber = true --relative line numbers
vim.o.termguicolors  = true --termguicolors
vim.o.spell          = true -- spell check for comments
vim.o.expandtab      = true -- use spaces instead of tabs
-- vim.o.ls        = 0 -- laststatus
-- vim.o.cmdheight      = 0 -- cmdheight

-- Tabs
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smarttab = true

vim.opt.shortmess:append({ c = true })
vim.o.inccommand = "nosplit"


vim.o.mouse = "a"
-- vim.o.autochdir = true
vim.o.clipboard = "unnamedplus"

vim.cmd("set backspace=indent,eol,start")
-- :noh to clear search highlighting

vim.opt.list = true
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300}
]])
