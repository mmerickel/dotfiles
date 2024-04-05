""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins
call plug#begin(stdpath('config') . '/plugged')

Plug 'airblade/vim-rooter'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'folke/tokyonight.nvim'
Plug 'glench/vim-jinja2-syntax'
Plug 'godlygeek/tabular'
Plug 'google/vim-jsonnet'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'  " required for telescope
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-tree/nvim-web-devicons'  " required for lualine, nvim-tree, and telescope
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'rust-lang/rust.vim'
Plug 'sophacles/vim-bundle-mako'
Plug 'stevearc/dressing.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-projectconfig'
Plug 'windwp/nvim-ts-autotag'

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

" Favorite filetypes
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default indentation
set shiftwidth=4
set tabstop=4
set expandtab

" Indent sanely
set autoindent
"set copyindent
"set smarttab

" Allow the cursor to go everywhere
set virtualedit=insert,onemore,block

" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" Wrap lines
set wrap

" When wrapping, break on words instead of characters
set linebreak

" Avoid adding 2 spaces when joining lines together.
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
syntax on

" Set colorscheme
colorscheme tokyonight-night

" Set terminal title
set title

" Highlight the current line and column
set cursorline
set cursorcolumn
set colorcolumn=90

" Set # of lines visible around the cursor when scrolling vertically
set scrolloff=5

" Always show the signcolumn otherwise coc will hide/show it all the time
set signcolumn=yes

" Ignore some files
set wildignore+=*.jpg,*.gif,*.png,*.hdr,*.gz
set wildignore+=*.o,*.obj,*.so,*.a,*.dll,*.dylib
set wildignore+=.DS_Store,Thumbs.db
set wildignore+=*.svn,*.git,*.swp,*.pyc,*.class,*/__pycache__/*,*/.ruff_cache/*

" Always show current position
set ruler

" Show line number
set number

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

" Remove a lot of visual effects like scrollbar/menu/tabs from GUI
set guioptions=a

" Show as much of the last line as possible
set display=lastline

" Show a little more status about running command
set showcmd

" Increase the cmd height to avoid hit-enter prompts
set cmdheight=2

" Do not fold blocks by default
set foldmethod=manual

"Setup higlighting of whitespace that shouldn't be there
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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

"Display the end of lines and tabs as special characters
set listchars=tab:>-,trail:+,eol:$
set list
nnoremap <silent> <leader>s :set nolist!<cr>

" Toggle line numbers
nnoremap <leader>n :set nu!<cr>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"Resize the window
nnoremap <leader>el :set columns=220<cr>
nnoremap <leader>ej :set columns=130<cr>
nnoremap <leader>eh :set columns=90<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Have Vim jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  "Avoid showing whitespace while in insert mode
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd BufEnter,BufRead,BufNewFile,InsertLeave * match ExtraWhitespace /\s\+$/

  " Override settings for various filetypes
  autocmd FileType html,css,scss,sass setlocal sw=2 ts=2 et
  autocmd FileType javascript,javascript.jsx,htmljinja setlocal sw=2 ts=2 et
  autocmd FileType json setlocal sw=2 ts=2 et
  autocmd FileType jsonnet setlocal sw=2 ts=2 et
  autocmd FileType rst setlocal sw=2 ts=2 et
  autocmd FileType yaml setlocal sw=2 ts=2 et
  autocmd FileType vim setlocal sw=2 ts=2 et
  autocmd FileType terraform,tfvars setlocal sw=2 ts=2 et
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ '@yaegassy/coc-ruff',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-docker',
  \ 'coc-eslint',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-sql',
  \ 'coc-toml',
  \ 'coc-tsserver',
  \ 'coc-xml',
  \ 'coc-yaml',
  \ ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"autocmd User CocStatusChange,CocDiagnosticChange redrawstatus

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSV
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:csv_no_conceal = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lualine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('lualine').setup({
  extensions = {
    'fugitive',
    'nvim-tree',
  },
})
EOF

" Redraw when coc status changes
autocmd User CocStatusChange,CocDiagnosticChange lua require('lualine').refresh()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('nvim-tree').setup({
  disable_netrw = false,
  hijack_netrw = true,
  view = {
    width = 35,
    side = 'right',
  },
  filters = {
    git_ignored = false,
    custom = {
      '\\.jpg$', '\\.gif$', '\\.png$', '\\.hdr$', '\\.gz$',
      '\\.o$', '\\.obj$', '\\.so$', '\\.a$', '\\.dll$', '\\.dylib$',
      '\\.svn$', '\\.git$', '\\.swp$', '\\.pyc$', '\\.DS_Store',
      '\\.class$', '^__pycache__$', '^\\.ruff_cache$',
    },
  },
  live_filter = {
    always_show_folders = false,
  },
  git = {
    enable = false,
  },
})
EOF

nnoremap <leader>do :NvimTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rooter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rooter_cd_cmd = 'lcd'
let g:rooter_patterns = ['.git', '.hg', '.svn']
let g:rooter_buftypes = ['']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      },
    },
  },
})
EOF

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
    "json",
    "jsonnet",
    "lua",
    "markdown",
    "python",
    "query",
    "rust",
    "toml",
    "vim",
    "vimdoc",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {
    "rst",
  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Do not use treesitter for these languages
    disable = {
      "rst", -- highlighting is just poor, doesn't highlight links etc
    },

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
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,

    -- Do not use treesitter for these languages
    disable = {
      "yaml",  -- seems to do much worse than the builtin
    },
  },
  -- enable the windwp/nvim-ts-autotag plugin
  autotag = {
    enable = true,
  },
}

-- the Dockerfile.vim plugin defines the filetype=Dockerfile using uppercase
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3515
-- https://github.com/ekalinin/Dockerfile.vim/issues/67
vim.treesitter.language.register("dockerfile", "Dockerfile")
EOF

if filereadable(stdpath('config') . '/local/init.vim')
  execute 'source ' . stdpath('config') . '/local/init.vim'
endif
