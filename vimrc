""""""""""""""""""""""""""""""""""""""""""""""
" Enable -Plug- the plug-in manager
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')


Plug 'janko-m/vim-test'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neco-syntax'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Tmux omni func completer
Plug 'wellle/tmux-complete.vim'

" Tmux pane navigation
Plug 'christoomey/vim-tmux-navigator'

" Markdown preview
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

" Color testers
Plug 'guns/xterm-color-table.vim'

" Color display
Plug 'ap/vim-css-color'

" Plugin for git management
Plug 'tpope/vim-fugitive'

" Colors
Plug 'flazz/vim-colorschemes'

" File manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'

" JS
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" C lang
Plug 'zchee/deoplete-clang'

" Dotnet
Plug 'OmniSharp/omnisharp-vim'

" GQL
Plug 'jparise/vim-graphql', { 'for': 'gql' }

" Comments
Plug 'scrooloose/nerdcommenter'

" Search
Plug 'mileszs/ack.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set Default encoding
set encoding=utf8

" Set language for spelling
set spell spelllang=en

" Enable True colors for terminal
colorscheme wombat256i

" Enable Nerd Fonts (Patched)
set guifont=SFMono\ Nerd\ Font:h14

" Enable syntax highlights
syntax on

" Reduce re-renders
set lazyredraw

" No code wrap
set nowrap

" Enable Line number (Hybrid)
set number relativenumber

" Enable Auto Indentation
set smartindent
set autoindent
filetype indent on
filetype plugin indent on

" Use omni completions based on file type
filetype plugin on

" Use spaces instead of tabs
set expandtab
set smarttab

" Set Tab setting (1 tab == 2 spaces)
set tabstop=2
set shiftwidth=2

" Highlight search matches
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete white space on-save
" autocmd BufWritePre * :%s/\s\+$//e

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

" Set Spelling markers
highlight clear SpellBad
highlight SpellBad cterm=underline

" Set columns ruler
set colorcolumn=80

" Set cursor line highlight
set cursorline

" Set Search highlight color
highlight Search guibg=#9e9e9e

" Use system clipboard
set clipboard=unnamed

" Use lightgreen for highlight on extra traiting spaces
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+\%#\@<!$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabClosePreviewOnPopupClose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in xvn, git et.c anyway...
set nowb
set nobackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""
" Najeeb Key mapping
""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Set <Leader> key
let mapleader="\\"

" Search and replace mapping
map <Leader>s :%s/\<<C-r><C-w>\>/

" Search and replace mapping
map <Leader>f :Ack <C-r><C-w>
map <Leader>d :/\<<C-r><C-w>\>/<CR>

" Buffer Control mapping
map <Leader>w :w<CR>
map <Leader>Q :q!<CR>
map <Leader>b :buffer 

" Tab Control mapping
map <Leader>n :tabnext<CR>
map <Leader>p :tabprevious<CR>

" Pane resize mapping
map <Leader>, :vertical resize +5<CR>
map <Leader>. :vertical resize -5<CR>

" VIM Test mapping
map <Leader>t :TestNearest<CR>

" Move VISUAL LINE selection within buffer.
xnoremap <silent> K :call najeeb#functions#move_selection_up()<CR>
xnoremap <silent> J :call najeeb#functions#move_selection_down()<CR>

" ALE cycle errors
map <Leader>e :ALENext<CR>

" Markdown preview setting
map <leader>m :MarkdownPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = "dispatch"

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
" Enable on startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

""""""""""""""""""""""""""""""""""""""""""""""
" Tern-Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#types = 1
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

"" Set buffer mode to search file name
"let g:ctrlp_bufname_mod = ':t'

" Set match window location and behaviour
let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:25,results:25'

" Set Max depth of tested directories to search
let g:ctrlp_max_depth = 15

""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Auto open nerdtree on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close Vim if all buffers are closed and nerdtree is the last man standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
      \				[ 'filename', 'modified' ]
      \			],
      \	  'right':[
      \				[ 'lineinfo' ],
      \				[ 'fileencoding', 'percent' ],
      \				[ 'linter_errors', 'linter_warnings', 'gitbranch' ]
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
let g:ale_sign_error = '💣'
let g:ale_sign_warning = '🚩'

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
let g:ale_echo_msg_error_str = '💣'
let g:ale_echo_msg_warning_str = '🚩'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']

""""""""""""""""""""""""""""""""""""""""""""""
" Javascript Document plugin setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return = 1
let g:jsdoc_return_type = 1

""""""""""""""""""""""""""""""""""""""""""""""
" AG the silver searcher for vim.ack
""""""""""""""""""""""""""""""""""""""""""""""
let g:ackhighlight = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""
" Clang completion settings
""""""""""""""""""""""""""""""""""""""""""""""
if has('macunix')
  let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang'
  let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
else
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-6.0/lib/clang'
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
endif


let g:OmniSharp_timeout = 10
let g:OmniSharp_server_path = '/src/omnisharp/run'

