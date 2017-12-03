""""""""""""""""""""""""""""""""""""""""""""""
" Enable -Plug- the plug-in manager
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
Plug 'w0rp/ale', { 'for': 'javascript' }
Plug 'maximbaz/lightline-ale'
Plug 'janko-m/vim-test'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set Default encoding
set encoding=utf8

" => Set language for spelling
set spell spelllang=en

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

" => Enable Auto Indentation
filetype indent on
filetype plugin indent on
set smartindent
set autoindent

" => Use spaces instead of tabs
set expandtab

" => Be smart when using tabs ;)
set smarttab

" => 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Highlight search matches
set hlsearch

" Delete white space on-save
autocmd BufWritePre * :%s/\s\+$//e

" => Show keys
set showcmd

" => Set soft scroll (have few lines before / after cursor on screen)
set scrolloff=1

""""""""""""""""""""""""""""""""""""""""""""""
" Najeeb Key mapping
""""""""""""""""""""""""""""""""""""""""""""""
" => Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" => Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Set <leader> key
let mapleader="\\"

" Pane resize
map <leader>, :vertical resize +5<CR>
map <leader>. :vertical resize -5<CR>

" Better new line
nmap <CR> o<Esc>

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
" Set ignored paths
set wildignore+=*/tmp/*,*/node_modules/*,*/ios/*,*/android/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Set working path to nearest root
let g:ctrlp_working_path_mode = 'ra'

" Enable Lazy mode (Dont fucking search untill i stop !)
let g:ctrlp_lazy_update = 1

" Set buffer mode to search file name
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

""""""""""""""""""""""""""""""""""""""""""""""
" Light Line setting
""""""""""""""""""""""""""""""""""""""""""""""
" => Show LightLine always
set laststatus=2

" => LightLine:
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \				[ 'mode', 'paste' ],
      \				[ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \			],
      \	  'right':[
      \				[ 'lineinfo' ],
      \				[ 'percent' ],
      \				[ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
      \				[ 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \			]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""""""""
" VIM Test setting
""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-t> :TestNearest<CR>
nnoremap <C-t-t> :TestFile<CR>

