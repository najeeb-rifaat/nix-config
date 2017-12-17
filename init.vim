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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx' ] }
Plug 'jparise/vim-graphql', { 'for': 'gql' }
Plug 'w0rp/ale', { 'for': 'javascript' }
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'
Plug 'janko-m/vim-test'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/jspc.vim'

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

" Hide mode --INSERT-- (rely on lightline for mode flag)
set noshowmode

" Set Autofold to DISABLED
set nofoldenable

" Set default folding method
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
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

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocomplete)
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

" Enable Lazy mode (Do NOT fucking search until I stop for 500ms)
let g:ctrlp_lazy_update = 500

" Set buffer mode to search file name
let g:ctrlp_bufname_mod = ':t'

" Set maych window location and behaviour
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
      \ 'colorscheme': 'wombat256i',
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

" set lightline info
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
