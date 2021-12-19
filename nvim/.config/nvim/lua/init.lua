-- https://ithub.com/nanotee/nvim-lua-guide
--vim.o: behaves like :set
--vim.go: behaves like :setglobal
--vim.bo: behaves like :setlocal for buffer-local options
----vim.wo: behaves like :setlocal for window-local options

-- Tabs
vim.cmd [[
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set termguicolors
]]
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.opt.encoding = 'UTF-8'
vim.opt.shortmess:append {c = true}
vim.opt.inccommand = 'nosplit'

-- Number on side bar
vim.wo.number = true
vim.wo.relativenumber = true

vim.bo.autoindent = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

vim.o.smarttab = true
vim.o.mouse = "a"
vim.o.autochdir = true
vim.o.clipboard = "unnamedplus"

vim.cmd("set backspace=indent,eol,start")
-- :noh to clear search highlighting

vim.g.onedark_style = 'darker'

vim.opt.list = true
--vim.opt.listchars:append("eol:↴")

-- auto-session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- coc nvim
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 500

vim.cmd([[
let g:coc_global_extensions = [
	\ 'coc-clangd',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
			\ 'coc-phpls',
      \ 'coc-prettier',
			\ 'coc-powershell',
			\ 'coc-pyright',
			\ 'coc-sh',
			\ 'coc-snippets',
			\ 'coc-sql',
			\ 'coc-svg',
			\ 'coc-tailwindcss',
      \ 'coc-tsserver',
			\ 'coc-vimlsp',
			\ 'coc-xml',
			\ 'coc-yaml',
			\ 'coc-yank',
      \ ]
]])
