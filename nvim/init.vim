if has("win32")
	source $HOME/AppData/Local/nvim/plug-config/coc.vim
else
	source $HOME/.config/nvim/plug-config/coc.vim
endif

set hidden
set number
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set mouse=a
autocmd BufEnter * silent! lcd %:p:h
set encoding=UTF-8
filetype plugin indent on
set clipboard+=unnamedplus " y and p to clipboard
set backspace=indent,eol,start
" set nohlsearch " disable search highlighting :noh to claer

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Coc tailwind init :CocInstall @yaegassy/coc-volar @yaegassy/coc-nginx
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

if has("win32")
	call plug#begin('~/AppData/Local/nvim/plugged')
else
	call plug#begin('~/.config/nvim/plugged')
endif

Plug 'navarasu/onedark.nvim'         " Onedark theem
Plug 'preservim/nerdtree'            " File system explorer :NERDTree
Plug 'vim-syntastic/syntastic'       " Syntax checking
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completion
Plug 'tpope/vim-commentary'          " Commenting gcc & gc
Plug 'itchyny/lightline.vim'         " Status bar
Plug 'ap/vim-css-color'              " CSS Color preview
Plug 'ryanoasis/vim-devicons'        " Dev icons
" Plug 'beauwilliams/focus.nvim'       " Focused splits
Plug 'lewis6991/gitsigns.nvim'       " Git diff
Plug 'tpope/vim-fugitive'            " Git plugin
Plug 'danilamihailov/beacon.nvim'    " See cursor jump
Plug 'nvim-lua/plenary.nvim'         " Fuzzy finder
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'ahmedkhalf/project.nvim'       " Project Management :Telescope projects
Plug 'liuchengxu/vista.vim'          " tagbar LSP
Plug 'lukas-reineke/indent-blankline.nvim' " Indentation guides
Plug 'akinsho/toggleterm.nvim'       " Terminals
Plug 'windwp/nvim-autopairs'         " Auto-pair
" Plug 'Shatur/neovim-session-manager' " Session Manager
Plug 'goolord/alpha-nvim'            " Startup screen
Plug 'sindrets/winshift.nvim'        " Moving windows
Plug 'simonefranza/nvim-conv'        " Numeric conversion tool
Plug 'github/copilot.vim'            " Github copilot :Copilot setup
Plug 'honza/vim-snippets'            " Snippets

Plug 'yaegassy/coc-nginx', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme onedark
let g:onedark_style = 'darker'

" lightline
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
  	  \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" Key Bindings ---------------------------------------------------------------------------
command CDC cd %:p:h

inoremap <M-BS> <C-w>
inoremap <M-d> <cmd>norm! dw<CR>

xnoremap i <Esc>i

" nnoremap <C-f> :call CocActionAsync('jumpDefinition')<CR> " Jump to definition
nnoremap <C-c> <Esc>
nmap <F8> :TagbarToggle<CR>

" Window navigation :ball :vert ball
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-w> :tabclose<CR>

nnoremap <leader>pp <cmd>Telescope projects<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>>

" lua config
" ------------------------------------------------------------------------
lua << EOF
require('alpha').setup(require'alpha.themes.dashboard'.opts)
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  }
})
require('nvim-autopairs').setup{}
require('gitsigns').setup()
require("project_nvim").setup {}
require("telescope").load_extension('projects')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = select_vertical,
      },
			n = {
				["<C-s>"] = select_vertical,
			},
    },
  },
}

-- require("focus").setup({excluded_filetypes = {"toggleterm"}})

vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
}

require("toggleterm").setup{
  size = 20,
  open_mapping = [[<C-\>]],
  direction = 'horizontal',
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF



" NERDTree------------------------------------------------------------
" Shift C to change root, r to refresh
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 3

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :call NERDTreeToggleAndRefresh()<CR>
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
	if g:NERDTree.IsOpen()		
    :NERDTreeRefreshRoot
  endif
endfunction

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" coc-snippets------------------------------------------------------------
"" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
