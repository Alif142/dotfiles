" =========================
" Basic Vim Configuration
" =========================

" --- General ---
set nocompatible        " Use Vim defaults, not vi
set encoding=utf-8
set hidden              " Allow switching buffers without saving
set mouse=a             " Enable mouse (optional)

" --- UI ---
set number              " Show line numbers
set relativenumber      " Relative line numbers (good for movement)
set cursorline          " Highlight current line
set showcmd             " Show partial commands
set showmode            " Show current mode
set ruler               " Show cursor position
set laststatus=2        " Always show status line
set signcolumn=yes      " Prevent text shifting

" --- Indentation ---
set tabstop=4           " Tab width
set shiftwidth=4        " Indent width
set expandtab           " Tabs → spaces
set autoindent
set smartindent

" --- Search ---
set ignorecase          " Case-insensitive search
set smartcase           " Case-sensitive if uppercase used
set incsearch           " Incremental search
set hlsearch            " Highlight search results

" --- Scrolling ---
set scrolloff=8         " Keep cursor away from edges
set sidescrolloff=8


" --- File handling ---
set nobackup
set nowritebackup
set noswapfile
set undofile



" --- Performance ---
set updatetime=300

" --- Key mappings ---
let mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" Faster escape
inoremap jk <Esc>

" --- Quality of life ---
set clipboard=unnamedplus   " System clipboard (Linux)
set splitbelow
set splitright

" --- No colorscheme + transparent background ---
syntax on
set background=dark

colorscheme slate

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

