""""""""""""""""""""""""""""""""""""""""""""""
" Enable -Plug- the plugin manager
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set Default encoding
set encoding=utf8

" Enable Nerd Fonts (Patched)
set guifont=SFMono\ Nerd\ Font:h14

" Enable syntax highlights
syntax on

" Enable True colors for terminal
colorscheme wombat256i

" Set columns ruler
set colorcolumn=90

" Enable Line number (Hybrid)
set number relativenumber

" Set <leader> key
let mapleader="\\"

" Set tab setting
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent


" Highlight search matches
set hlsearch

" !IMPORTANT Delte white space onsave
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocompleter)
""""""""""""""""""""""""""""""""""""""""""""""
" Enable on startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#case_insensitive = 1



""""""""""""""""""""""""""""""""""""""""""""""
" CTRL P setting
""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*/node_modules/*,*/ios/*,*/android/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_lazy_update = 0

let g:ctrlp_bufname_mod = ':t'



""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Setting
""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1

" => Auto open nerd tree for directories
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" => Map Ctrl - N to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" => Show hidden files
let NERDTreeShowHidden = 1

" => Ignore system files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" => Auto refresh on fouce
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

""""""""""""""""""""""""""""""""""""""""""""""
" Light Line setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
