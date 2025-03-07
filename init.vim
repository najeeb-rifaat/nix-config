": """"""""""""""""""""""""""""""""""""""""""""""
" MINIMAL SETUP (https://www.guckes.net/vim/setup.html)
" """"""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set showcmd
set nobackup
set autochdir
set smartcase
set visualbell
set noerrorbells
set nostartofline
set nowritebackup
set shortmess+=c
set laststatus=2
set updatetime=500
set viminfo=%,'50,\"100,:100,n~/.neoviminfo
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Setting
" """"""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Start page
Plug 'mhinz/vim-startify'

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Status line
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" Sideline
Plug 'preservim/tagbar'

" Copilot
Plug 'github/copilot.vim'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Package
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'petertriho/cmp-git'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
" """"""""""""""""""""""""""""""""""""""""""""""
" Set color scheme (265bit)
colorscheme wombat256i
set termguicolors

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
set scrolloff=999

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

" Splits
set splitbelow
set splitright

" Indent line Setting
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set autoindent
set virtualedit=block

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

" Show hidden files in explorer window
let NERDTreeShowHidden=1


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

" LSP Actions and code navigation
nmap <silent> <Leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nmap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> <Leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" LUA setup
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "ast_grep", "bashls", "omnisharp", "jdtls", "ts_ls","svelte" }, -- Add LSPs you need
    automatic_installation = true,
})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --["rust_analyzer"] = function ()
    --    require("rust-tools").setup {}
    --end
}
EOF

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup()

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig').setup {
  --  capabilities = capabilities
  --}
EOF


lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- Install all parsers
    highlight = {
      enable = true, -- Enables syntax highlighting
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true, -- Enables automatic indentation
    },
  }

  vim.diagnostic.config({
    virtual_text = false,  -- Disable virtual text (so it doesn’t cut off)
    float = {
      source = "always",    -- Show source of diagnostic
      border = "rounded",   -- Make it look better
      wrap = true,          -- Enable line wrapping
    },
    underline = true,       -- Underline problematic code
    signs = true,           -- Show signs in the sign column
    update_in_insert = false, -- Don't update while typing
  })

  vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end,
  })

EOF
