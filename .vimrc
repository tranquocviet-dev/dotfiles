set termguicolors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:netrw_banner = 0
set signcolumn=no
set background=dark
set number
set rnu
set noexpandtab
set shiftwidth=4
set tabstop=4
set autoindent
set incsearch
set ignorecase
set smartcase
set nowrap
set noswapfile
set scrolloff=6
set cursorline
set nocompatible
set autochdir
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
filetype plugin on
syntax enable

let mapleader = " "
nnoremap <Leader>fs :Files<CR>
nnoremap <Leader>pu :PlugInstall<CR>
nnoremap <Leader>fw :update<CR>
nnoremap <Leader>fo :source<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>fe :Explore<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>

let g:vimwiki_list = [{'syntax': 'markdown',
			\ 'ext': 'md',
			\ 'diary_rel_path': './'
			\ }]
let g:vimwiki_auto_diary_index = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_sync_branch = "main"

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vimwiki/vimwiki'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
call plug#end()

colorscheme solarized8_flat

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
