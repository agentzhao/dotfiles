vim.g.mapleader = "," -- using comma as leader

-- Standard stuff
vim.opt.encoding     = "UTF-8"
vim.o.mouse          = "a" -- mouse
vim.o.cursorline     = true -- highlight current line
vim.o.autoindent     = true -- auto indent
vim.o.showmatch      = true -- show matching brackets
vim.o.number         = true -- show line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.termguicolors  = true -- termguicolors
vim.o.spell          = true -- spell check for comments
vim.o.expandtab      = true -- use spaces instead of tabs
vim.o.list           = true -- show whitespaces
-- todo fix this as default ftplugin overrides :verbose set formatoptions
vim.opt.formatoptions:remove { "c", "r", "o" } -- don't auto-wrap comments
-- vim.o.cmdheight = 0 -- cmdheight
-- vim.o.laststatus        = 0 -- laststatus
-- vim.o.autochdir = true

-- Tabs
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smarttab = true

vim.opt.shortmess:append({ c = true })
vim.o.inccommand = "nosplit"

vim.o.clipboard = "unnamedplus"

vim.cmd("set backspace=indent,eol,start")
-- :noh to clear search highlighting

vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300}
]])
