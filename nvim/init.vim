" Install plugins
call plug#begin(stdpath('config') . '/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree', { 'on':  ['NERDTreeClose', 'NERDTreeToggle'] }
Plug 'tomasiser/vim-code-dark'

call plug#end()

" Turn backup off
set nobackup
set noswapfile

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set how many lines of history VIM remembers
set history=1000

" Update time for various features
set updatetime=300

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow the cursor to go everywhere
set virtualedit=insert,onemore,block

" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" Wrap lines
set wrap

" Avoid adding 2 spaces when joining lines together.
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
syntax on

" Set colorscheme
colorscheme codedark

" Set terminal title
set title

" Highlight the current line and column
set cursorline
set cursorcolumn
set colorcolumn=90

" Set # of lines visible around the cursor when scrolling vertically
set scrolloff=10

" Always show the signcolumn otherwise coc will hide/show it all the time
set signcolumn=yes

" Turn on Wild Menu
"set wildmenu

" Completion similarly to shell
"set wildmode=list:longest,full

" Ignore some files
set wildignore+=*.jpg,*.gif,*.png,*.hdr,*.gz
set wildignore+=*.o,*.obj,*.so,*.a,*.dll,*.dylib
set wildignore+=.DS_Store,Thumbs.db
set wildignore+=*.svn,*.git,*.swp,*.pyc,*.class,*/__pycache__/*,*/.ruff_cache/*

" Always show current position
set ruler

" Command bar is 2-high
"set cmdheight=1

" Show line number
set number

" Do not redraw when running macros .. lazyredraw
"set lazyredraw

" Change buffer without saving
set hidden

" Switch to existing tab then window when switching buffers
set switchbuf=usetab

" Set backspace to work in more situations
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase
set infercase

" Use case-sensitive search if a capital letter is present
set smartcase

" Search dynamically
set incsearch

" Highlight search items but turn it off when program starts
set hlsearch
nohlsearch

" Set magic!
"set magic

" Turn off all sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

" Show matching brackets
set showmatch

" How many tenths of a second to blink
"set mat=2

" Insert-mode completion option
"set completeopt=menuone,longest,preview

" Remove a lot of visual effects like scrollbar/menu/tabs from GUI
set guioptions=a

" Always hide the statusline
set laststatus=0

" Show as much of the last line as possible
set display=lastline

" Show a little more status about running command
set showcmd

" Do not fold blocks by default
set foldmethod=manual

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader
let mapleader = ","

" Remap the semicolon to save typing colon
nnoremap ; :

" Close the current buffer
nnoremap <leader>x :close!<cr>

" Remap ` and ' for marking
nnoremap ' `
nnoremap ` '

" Make Y consistent with C and D by yanking up to end of line
nnoremap Y y$

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Move between buffers with arrow keys
nnoremap <right> :bnext<cr>
nnoremap <left> :bprev<cr>

" A little bit of Emacs-style navigation.
inoremap <C-a> <home>
inoremap <C-e> <end>
nnoremap <C-a> 0
nnoremap <C-e> $

" Modify a few commands to work on local lines in a wrapped line
noremap k gk
noremap j gj
noremap H g^
noremap L g$

" Toggle line numbers
nnoremap <leader>n :set nu!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = [
	\ '\.jpg$', '\.gif$', '\.png$', '\.hdr$', '\.gz$'
	\ , '\.o$', '\.obj$', '\.so$', '\.a$', '\.dll$', '\.dylib$'
	\ , '\.svn$', '\.git$', '\.swp$', '\.pyc$', '\.DS_Store'
	\ , '\.class$', '__pycache__', '.ruff_cache' ]
let NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 0
let NERDTreeHighlightCursorline = 1
let NERDTreeDirArrows = 0
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
nnoremap <leader>do :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Treesitter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "dockerfile",
    "gitcommit",
    "go",
    "hcl",
    "html",
    "javascript",
    "lua",
    "markdown",
    "python",
    "rst",
    "rust",
    "toml",
    "vim",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Disable tree-sitter when the file is too large
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
