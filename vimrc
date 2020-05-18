""""""""""""""""""""""""""""""""""""""""""""""
" Enable *Plug* the plug-in manager
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Essentials
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'

" ColorSchemes
Plug 'flazz/vim-colorschemes'

" TagBar
Plug 'majutsushi/tagbar'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" SCM
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" CodeDoc
Plug 'kkoomen/vim-doge'

" TestRunner
Plug 'janko-m/vim-test'

" Search
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

" FileManager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }

" StatusLine
Plug 'itchyny/lightline.vim'

" CodeLint
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'

" CodeCompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" GQL
Plug 'jparise/vim-graphql', { 'for': 'gql' }

" Indentation Line
Plug 'Yggdroot/indentLine'

" CSS and Colors
Plug 'ap/vim-css-color'
Plug 'tpope/vim-haml', { 'for': [ 'css', 'scss', 'sass' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'css', 'scss', 'sass' ] }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" ColorSchemes - Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Enable True colors for terminal
colorscheme wombat256i

""""""""""""""""""""""""""""""""""""""""""""""
" TagBar - Setting
""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Markdown - Setting
""""""""""""""""""""""""""""""""""""""""""""""
map <leader>m :MarkdownPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" SCM - Setting
""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :Gstatus<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" CodeDoc - Setting
""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>d :DogeGenerate<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" TestRunner - Setting
""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = "neovim"
map <Leader>t :TestNearest<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Search - Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Use file name not directory
let g:ctrlp_by_filename = 1

" Set ignored paths
set wildignore+=*/tmp/*,*/node_modules/*,*/ios/*,*/android/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|DS_store|class)$',
  \ }

" Set working path to nearest root
let g:ctrlp_working_path_mode = 'ra'

" Enable Lazy mode (Do NOT fucking until I stop for 250MS)
let g:ctrlp_lazy_update = 250

" Set match window location and behaviour
let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:25,results:25'

" Set Max depth of directories
let g:ctrlp_max_depth = 10

" AG the silver searcher for vim.ack
" Map silver searcher
map <Leader>s :Ack <C-r><C-w>

let g:ackhighlight = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""
" FileManager - Setting
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
" StatusLine - setting
""""""""""""""""""""""""""""""""""""""""""""""
" Show LightLine always
set laststatus=2

" LightLine:
let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [
  \         [ 'mode', 'paste' ],
  \         [ 'filename', 'modified' ]
  \       ],
  \     'right':[
  \         [ 'lineinfo' ],
  \         [ 'fileencoding', 'percent' ],
  \         [ 'linter_errors', 'linter_warnings', 'gitbranch' ]
  \       ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head'
  \   },
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CodeLint - Setting
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
  \  'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \ }

" Show errors in LightLine:
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = [' %d', ' %d', '']

" Explicitly disable csc linter for c#
let g:ale_linters_ignore = {
  \    'cs': ['csc', 'mcsc'],
  \    'java': [ 'javac' ]
  \  }

" ALE cycle errors
map <Leader>e :ALENext<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" CodeCompletion - setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \   'coc-angular',
  \   'coc-css',
  \   'coc-eslint',
  \   'coc-html',
  \   'coc-java',
  \   'coc-json',
  \   'coc-omnisharp',
  \   'coc-tsserver',
  \   'coc-python',
  \   'coc-yank',
  \   'coc-spell-checker'
  \ ]

map <leader>r <Plug>(coc-rename)
map <leader>R <Plug>(coc-reference)
map <leader>d <Plug>(coc-definition)
map <leader>D <Plug>(coc-type-definition)
map <leader>i <Plug>(coc-implementation)
map <leader>f <Plug>(coc-format-selected)
map <leader><leader> <Plug>(coc-codeaction)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in xvn, git et.c anyway...
set nowb
set nobackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Set Default encoding
set encoding=utf8

" Set language for spelling
set spell spelllang=en

" Enable Nerd Fonts (Patched)
set guifont=SFMono\ Nerd\ Font:h16

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

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

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

" Set columns ruler
set colorcolumn=81,99

" Set cursor line highlight
set cursorline
set cursorcolumn

" Use system clipboard
set clipboard=unnamed

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

""""""""""""""""""""""""""""""""""""""""""""""
" Custom Key mapping
""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Set <Leader> key
let mapleader="\\"

" Search and replace mapping
map <Leader>S :%s/\<<C-r><C-w>\>/

" Search and replace mapping
map <Leader>d :/\<<C-r><C-w>\>/<CR>

" Buffer Control mapping
map <Leader>w :w<CR>
map <Leader>Q :q!<CR>
map <Leader>b :buffer

" Buffer navigation mapping
map <Leader>] :bn<CR>
map <Leader>[ :bp<CR>

" Tab navigation mapping
map <Leader>} :tabnext<CR>
map <Leader>{ :tabprevious<CR>

" Pane resizS mapping
map <Leader>, :vertical resize +5<CR>
map <Leader>. :vertical resize -5<CR>

" Move VISUAL LINE selection within buffer.
xnoremap <silent> K :call najeeb#functions#move_selection_up()<CR>
xnoremap <silent> J :call najeeb#functions#move_selection_down()<CR>
xnoremap <silent> <space> :call najeeb#functions#clean_useless_spaces()<CR>

" Remove useless spaces
map <leader><space> :%s/\s\+$//<CR>

" Map terminal mode switch
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""
" Indent line Setting
""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

""""""""""""""""""""""""""""""""""""""""""""""
" Line flow Setting
""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:>-,trail:~,extends:+,precedes:<
set list

""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Setting
""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search match highlights
set hlsearch
highlight Search ctermbg=Grey ctermfg=Red cterm=bold,underline

" Set error highlights
highlight Error ctermbg=Yellow ctermfg=White cterm=underline
highlight CocErrorSign ctermfg=Yellow

" Set TODO highlights
highlight Todo ctermbg=LightYellow cterm=italic,bold

" Set Spelling mistake highlights
highlight clear SpellBad
highlight SpellBad cterm=italic,underline
highlight SpellCap ctermbg=none cterm=bold,underline

" Set git Diff highlights
highlight DiffChange ctermbg=Green ctermfg=none
highlight DiffAdd ctermbg=LightBlue ctermfg=Black
highlight DiffText ctermbg=LightBlue ctermfg=Black cterm=underline
highlight DiffDelete ctermbg=Yellow ctermfg=Black cterm=strikethrough

" Set column ruler highlight
highlight colorcolumn ctermbg=Red ctermfg=Yellow

" No gutter highlights
highlight clear SignColumn

" Use LightBlue for highlight on extra traiting spaces
highlight UnwanttedTab ctermbg=LightBlue ctermfg=Green
highlight TrailSpace ctermbg=LightBlue ctermfg=Green
match UnwanttedTab /\t/
match TrailSpace / \+$/
