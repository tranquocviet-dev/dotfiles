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
set number
set mouse=a
" set rnu
set signcolumn=no
set background=dark
set noexpandtab
set shiftwidth=4
set tabstop=4
set autoindent
set incsearch
set ignorecase
set smartcase
set nowrap
set noswapfile
" set cursorline
set nocompatible
set completeopt=longest,menuone
set noshowmode
set showtabline=0
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
filetype plugin on
syntax enable

let mapleader = " "
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>
nnoremap <Leader><CR> :VimwikiTabDropLink<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

let g:vimwiki_list = [{'syntax': 'markdown',
			\ 'ext': 'md',
			\ 'diary_rel_path': './',
			\ 'path': '~/vimwiki'
			\ }]
let g:vimwiki_auto_diary_index = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_sync_branch = "main"

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'tinted-theming/tinted-vim'
call plug#end()

let base16colorspace=256
colorscheme base16-solarized-dark

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

highlight htmlBold gui=bold

augroup markdown_header
  autocmd!
  autocmd BufNewFile *.md silent! call InsertMarkdownHeader()
augroup END

function! InsertMarkdownHeader()
  " Get the current filename without the extension
  let filename = expand('%:t:r')
  " Create the H1 header string
  let header = "# " . filename . "\n\n"
  " Insert the header at the beginning of the file
  call append(0, split(header, '\n'))
endfunction
