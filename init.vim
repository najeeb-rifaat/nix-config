" """"""""""""""""""""""""""""""""""""""""""""""
" MINIMAL SETUP (https://www.guckes.net/vim/setup.html)
" """"""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set showcmd
set nobackup
set autochdir
set visualbell
set noerrorbells
set nostartofline
set nowritebackup
set shortmess+=c
set laststatus=2
set updatetime=500
set viminfo=%,'50,\"100,:100,n~/.neoviminfo
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Setting
" """"""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Start page
Plug 'mhinz/vim-startify'

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Status line
Plug 'itchyny/lightline.vim'

" ColorSchemes
Plug 'flazz/vim-colorschemes'

" Stntax highlight
Plug 'sheerun/vim-polyglot'

" Indentation Line
Plug 'Yggdroot/indentLine'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" SCM
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File Manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }

" LSP package
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
" """"""""""""""""""""""""""""""""""""""""""""""
" Set color scheme (265bit)
colorscheme wombat256i

" Set color space (265bit)
if !has('gui_running')
  set t_Co=256
endif

" Enable italic fonts
let g:vem_colors_italic = 1

" Reduce re-renders
set lazyredraw
set ttyfast

" Set Default encoding
set encoding=utf8

" Set language for spelling
set spell spelllang=en

" Enable syntax highlight
syntax on

" Enable Nerd Fonts (Patched)
set guifont=SFMono\ Nerd\ Font:h16

" Enable Line number (Hybrid)
set number relativenumber

" When searching try to be smart about cases
set smartcase

" Set columns ruler
set ruler
set colorcolumn=81,99

" Set cursor line highlight
set cursorline
set cursorcolumn

" Use system clipboard
set clipboard=unnamedplus

" Set leading and trailing line chars
set nowrap
set sidescroll=10
set list listchars=tab:>-,trail:.,precedes:<,extends:+

" Indent line Setting
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set autoindent

" Netrw absolute width of netrw window
let g:netrw_winsize = -28

"  Netrw do not display info on the top of window
let g:netrw_banner = 0
let g:netrw_altv = 1

" Netrw tree-view
let g:netrw_liststyle = 3

" Netrw sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" Netrw use the previous window to open file
let g:netrw_browse_split = 4

" Set Spelling mistake highlights
highlight clear SpellBad
highlight SpellBad cterm=italic,underline
highlight SpellCap ctermbg=none cterm=bold,underline

" Highlight search match highlights
set hlsearch
highlight Search ctermbg=Grey ctermfg=black cterm=bold,underline

" Set git Diff highlights
highlight DiffChange ctermbg=Green ctermfg=none
highlight DiffAdd ctermbg=LightBlue ctermfg=Black
highlight DiffText ctermbg=LightBlue ctermfg=Black cterm=underline
highlight DiffDelete ctermbg=Yellow ctermfg=Black cterm=strikethrough



""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping Setting
" """"""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Set <Leader> key
let mapleader="\\"

" Remove useless spaces
nmap <leader><space> :%s/\s\+$//<CR>

" Openup git fugetive
nmap <leader>g :Git<CR>

" Openup explorer
map <Leader>e :NERDTreeToggle<CR>

" Openup terminal
map <Leader>T :terminal<CR>

" Map terminal mode switch
tnoremap <Esc> <C-\><C-n>

" Search - Setting
nmap <C-p> :Files<CR>
nmap <C-o> :Buffers<CR>
nmap <C-s> :Ag<CR>

" FZF Key Mapping
let g:fzf_action = {
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit'
  \ }

" Buffer Control mapping
map <Leader>w :w<CR>
map <Leader>Q :q!<CR>

" Tab navigation mapping
map <Leader>t :tabnew<CR>
map <Leader>] :tabnext<CR>
map <Leader>[ :tabprev<CR>
