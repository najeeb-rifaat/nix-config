""""""""""""""""""""""""""""""""""""""""""""""
" Enable -Plug- the plug-in manager
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Essentials
Plug 'mileszs/ack.vim'
Plug 'janko-m/vim-test'
Plug 'kkoomen/vim-doge'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neco-syntax'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

" Previews
Plug 'majutsushi/tagbar'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Tmux pane navigation
Plug 'christoomey/vim-tmux-navigator'

" Plugin for git management
Plug 'tpope/vim-fugitive'

" Colors
Plug 'flazz/vim-colorschemes'

" File manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }

" Linting
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'

" GQL
Plug 'jparise/vim-graphql', { 'for': 'gql' }

" CSS and Colors
Plug 'ap/vim-css-color'
Plug 'tpope/vim-haml', { 'for': [ 'css', 'scss', 'sass' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'css', 'scss', 'sass' ] }

" Language assist COC
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" Ctag tagbar
""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Auto Complete Preview Settings
""""""""""""""""""""""""""""""""""""""""""""""
" Float preview
let g:float_preview#docked = 1

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menu,noselect
"set completeopt=noinsert,menu,noselect,preview

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

" More responsive
set updatetime=300

" Reduce re-renders
set lazyredraw
set ttyfast

" No code wrap, and side scroll on end of long line
set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:+

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
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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
set colorcolumn=81

" Set cursor line highlight
set cursorline

" Set Highlights color
highlight Search guibg=#9E1199 ctermfg=White
highlight Error ctermbg=Yellow ctermfg=Black cterm=underline,italic
highlight ALEError ctermbg=none cterm=underline

" Use system clipboard
set clipboard=unnamed

" Use lightgreen for highlight on extra traiting spaces
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+\%#\@<!$/

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Docs mapping
map <Leader>d :DogeGenerate<CR>

" Buffer Control mapping
map <Leader>w :w<CR>
map <Leader>Q :q!<CR>
map <Leader>b :buffer

" Tab Control mapping
map <Leader>} :tabnext<CR>
map <Leader>{ :tabprevious<CR>

" Buffer Control mapping
map <Leader>] :buffernext<CR>
map <Leader>[ :bufferprevious<CR>

" Pane resize mapping
map <Leader>, :vertical resize +5<CR>
map <Leader>. :vertical resize -5<CR>

" VIM Test mapping
map <Leader>t :TestNearest<CR>

" VIM Tern mapping
map <Leader>jd :TernDefPreview<CR>
map <Leader>jr :TernRename<CR>

" Move VISUAL LINE selection within buffer.
xnoremap <silent> K :call najeeb#functions#move_selection_up()<CR>
xnoremap <silent> J :call najeeb#functions#move_selection_down()<CR>
xnoremap <silent> <space> :call najeeb#functions#clean_useless_spaces()<CR>

" ALE cycle errors
map <Leader>e :ALENext<CR>

" Markdown preview setting
map <leader>m :MarkdownPreview<CR>

" Remove useless spaces
map <leader><space> :%s/\s\+$//<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Test uses neovim terminal
""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = "neovim"

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete setting (Autocomplete)
""""""""""""""""""""""""""""""""""""""""""""""
" Enable on startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

""""""""""""""""""""""""""""""""""""""""""""""
" CTRL P setting
""""""""""""""""""""""""""""""""""""""""""""""
" Search by file name not directory
let g:ctrlp_by_filename = 1

" Set ignored paths
set wildignore+=*/tmp/*,*/node_modules/*,*/ios/*,*/android/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|DS_store)$',
  \ }

" Set working path to nearest root
let g:ctrlp_working_path_mode = 'ra'

" Enable Lazy mode (Do NOT fucking search until I stop for 500ms)
let g:ctrlp_lazy_update = 200

" Set match window location and behaviour
let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:25,results:25'

" Set Max depth of tested directories to search
let g:ctrlp_max_depth = 10

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
let g:ale_completion_enabled = 0

" Auto fix on save:
let g:ale_fix_on_save = 0

" Signs
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

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
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = [' %d', ' %d', '']

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

""""""""""""""""""""""""""""""""""""""""""""""
" vCooler setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set dialogue type (Using YAD gtk tool)
let g:vcooler_custom_picker='yad --width 500 --entry --title "Choooose the color ?" --color'

""""""""""""""""""""""""""""""""""""""""""""""
" Go setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

""""""""""""""""""""""""""""""""""""""""""""""
" COC setting
""""""""""""""""""""""""""""""""""""""""""""""
map <leader>r <Plug>(coc-rename)
map <leader>R <Plug>(coc-reference)
map <leader>d <Plug>(coc-definition)
map <leader>D <Plug>(coc-type-definition)
map <leader>i <Plug>(coc-implementation)
map <leader><leader> <Plug>(coc-codeaction)
