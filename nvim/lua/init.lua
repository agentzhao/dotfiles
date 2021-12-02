-- https://github.com/nanotee/nvim-lua-guide
--vim.o: behaves like :set
--vim.go: behaves like :setglobal
--vim.bo: behaves like :setlocal for buffer-local options
----vim.wo: behaves like :setlocal for window-local options

-- Tabs
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.opt.encoding = 'UTF-8'
vim.opt.shortmess:append {c = true}

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
