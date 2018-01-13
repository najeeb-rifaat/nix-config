""""""""""""""""""""""""""""""""""""""""""""""
" Enable -Plug- the plug-in manager
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'janko-m/vim-test'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'flazz/vim-colorschemes'

" File manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale', { 'for': [ 'javascript', 'c' ] }
Plug 'maximbaz/lightline-ale'

" CLang
if has('macunix')
  Plug 'zchee/deoplete-clang', { 'for': 'c' }
  let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang/9.0.0/'
else
  Plug 'tweekmonster/deoplete-clang2', { 'for': 'c' }
endif

" JS
Plug 'othree/jspc.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx' ] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'javascript' }

" GQL
Plug 'jparise/vim-graphql', { 'for': 'gql' }

" Markdown
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Comments
Plug 'scrooloose/nerdcommenter'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set Default encoding
set encoding=utf8

" Set language for spelling
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

" Enable Auto Indentation
filetype indent on
filetype plugin indent on
set smartindent
set autoindent

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Set Tab setting (1 tab == 2 spaces)
set shiftwidth=2
set tabstop=2

" Highlight search matches
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete white space on-save
autocmd BufWritePre * :%s/\s\+$//e

" Show keys
set showcmd

" Set soft scroll (have few lines before / after cursor on screen)
set scrolloff=1

" Hide mode --INSERT-- (rely on LightLine for mode flag)
set noshowmode

" Set Autofold to DISABLED
set nofoldenable

" Set default folding method
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabClosePreviewOnPopupClose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in xvn, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""
" Najeeb Key mapping
""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Better new line
nmap <CR> O<Esc>

" Set <leader> key
let mapleader="\\"

" Save File mapping
map <leader>w :w<CR>

" Buffer Control mapping
map <leader>' :bn<CR>
map <leader>; :bp<CR>
map <leader>q :q!<CR>

" Tab Control mapping
map <leader>n :tabnew<CR>
map <leader>] :tabnext<CR>
map <leader>[ :tabprevious<CR>

" Pane resize mapping
map <leader>, :vertical resize +5<CR>
map <leader>. :vertical resize -5<CR>

" JS Doc mapping
nmap <leader>d :JsDoc<CR>

" VIM Test mapping
nnoremap <C-t> :TestNearest<CR>
nnoremap <C-t-t> :TestFile<CR>

" Move VISUAL LINE selection within buffer.
xnoremap <silent> K :call najeeb#functions#move_selection_up()<CR>
xnoremap <silent> J :call najeeb#functions#move_selection_down()<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
" Enable on startup
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""
" Tern-Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#include_keywords = 1

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

" Enable Lazy mode (Do NOT fucking search until I stop for 500ms)
let g:ctrlp_lazy_update = 500

" Set buffer mode to search file name
let g:ctrlp_bufname_mod = ':t'

" Set match window location and behaviour
let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:25,results:25'

" Set Max depth of tested directories to search
let g:ctrlp_max_depth = 15

""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Map Ctrl - N to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden = 1

" Ignore system files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

""""""""""""""""""""""""""""""""""""""""""""""
" Light Line setting
""""""""""""""""""""""""""""""""""""""""""""""
" Show LightLine always
set laststatus=2

" LightLine:
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
      \				[ 'fileencoding', 'filetype', 'charvaluehex' ],
      \				[ 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \			]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto completion:
let g:ale_completion_enabled = 1

" Auto fix on save:
let g:ale_fix_on_save = 1

" ERROR/Warning color
highlight ALEError ctermbg=DarkRed
highlight ALEWarning ctermbg=DarkMagenta

" Signs
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚠'

" set LightLine info
let g:lightline.component_expand = {
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }

let g:lightline.component_type = {
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \ }

" Show errors in LightLine:
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""""""""""""""""""""""""""""""""""""""""""""""
" JSX setting
""""""""""""""""""""""""""""""""""""""""""""""
" Enable JSX for js and other file types
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""
" Better Vim Diff
""""""""""""""""""""""""""""""""""""""""""""""
" Set Colors for vim Diff
highlight DiffChange cterm=none ctermfg=fg ctermbg=DarkGreen gui=none guifg=fg guibg=DarkGreen

""""""""""""""""""""""""""""""""""""""""""""""
" Javascript Document plugin setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return = 1
let g:jsdoc_return_type = 1
