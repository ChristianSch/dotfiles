if &compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8

" set shell=sh

set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set guifont=Fira\ Code:h12

if dein#load_state('~/.dein')
  call dein#begin('~/.dein')
  call dein#add('~/.dein')

  " fuzzy file search
  call dein#add('ctrlpvim/ctrlp.vim')
  " auto completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('artur-shaik/vim-javacomplete2')
  " file browser
  call dein#add('scrooloose/nerdtree')
  " formatting
  call dein#add('sbdchd/neoformat')
  " UI
  call dein#add('itchyny/lightline.vim')
  call dein#add('taohex/lightline-buffer')
  call dein#add('airblade/vim-gitgutter')
  " intelligent buffer closing
  call dein#add('qpkorr/vim-bufkill')
  " commenting code
  call dein#add('tomtom/tcomment_vim')
  " also repeat commands
  call dein#add('tpope/vim-repeat')
  " silver surfer
  call dein#add('mileszs/ack.vim')
  " tmux
  call dein#add('benmills/vimux')

  " indentation, parentheses and stuff
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('tpope/vim-surround')
  call dein#add('terryma/vim-multiple-cursors')
  " EMACS SLIME for repl in vim
  " call dein#add('jpalardy/vim-slime')

  " langs
  call dein#add('derekwyatt/vim-scala')
  call dein#add('ensime/ensime-vim')
  " call dein#add('JuliaEditorSupport/julia-vim')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
set tabstop=4 shiftwidth=4 expandtab
set smarttab smartindent autoindent

set laststatus=2
set hidden
set mouse=a
set nowrap

" hide tilde
highlight NonText ctermfg=0

augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" use OS clipboard
set clipboard+=unnamedplus

" ignore case in search
set ignorecase

" Show the filename in the window titlebar
set title

if (exists('+colorcolumn'))
    set colorcolumn=90
    highlight ColorColumn ctermbg=9
endif

" dont wrap text automatically
set fo-=t

set textwidth=90

" always show tabline
set showtabline=2

" Always show line numbers, but only in current window.
set number
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

" ======== SHORTCUTS ========
" set shortcuts for buffer cycling
nnoremap <C-x> :bnext<CR>
nnoremap <C-y> :bprevious<CR>

" toggle tagbar plugin
nmap <F8> :TagbarToggle<CR>

" dispatch mapping to invoke make or such
nnoremap <F9> :Dispatch<CR>

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" run command in tmux pane
map <Leader>vp :VimuxPromptCommand<CR>


" ======== PLUGINS ========
" ignored files for nerdtree, vim-vinegar and netrw
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules/*,*bower_components/*,*.pyc

" close nerdtree when last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" http://ensime.org/editors/vim/install/
" autocmd BufWritePost *.scala silent :EnTypeCheck

" let g:ctrlp_user_command = ['.git', 'cd %s; rg --files-with-matches ".*"', 'find %s -type f']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" disable guessing of project root
let g:ctrlp_working_path_mode = ""

" minimal lightline setup
let g:lightline = {
    \ 'colorscheme': 'nord',
     \ 'active': {
        \   'left': [ [ 'mode' ] ],
        \   'right': [ ]
        \ },
	\ 'tabline': {
		\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
		\ 'right': [ ],
		\ },
	\ 'component_expand': {
		\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
		\ },
	\ 'component_type': {
		\ 'buffercurrent': 'tabsel',
		\ },
	\ 'component_function': {
		\ 'bufferbefore': 'lightline#buffer#bufferbefore',
		\ 'bufferafter': 'lightline#buffer#bufferafter',
		\ 'bufferinfo': 'lightline#buffer#bufferinfo',
		\ },
	\ }

" simple mode indicator
" see: https://github.com/itchyny/lightline.vim/issues/113
let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'V',
        \ "\<C-v>": 'V',
        \ 's' : 'S',
        \ 'S' : 'S',
        \ "\<C-s>": 'S'
        \ }

" transparent background
" see: https://github.com/itchyny/lightline.vim/issues/168
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
" let s:palette.inactive.middle = s:palette.normal.middle
" let s:palette.tabline.middle = s:palette.normal.middle

let g:lightline_buffer_excludes = ['vimfiler']
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'

" the silver searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep --smart-case'
" replace ag with Ack, no need to type Ack any more
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" rainbow parentheses on startup
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:NERDTreeUpdateOnWrite = 1
let g:NERDTreeMinimalUI = 1

" java auto completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" autocmd VimEnter * NERDTree
" au VimEnter * vsplit

" move cursor to file if any is open, otherwise stay on nerdtree
" autocmd VimEnter * if argc() | wincmd p | endif

colorscheme nord
set background=dark
