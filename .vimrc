" Loading pathogen plugins
call pathogen#infect()

" Enable indentation
filetype plugin indent on

" Changing <Leader>
let mapleader=","

" Mappings
nnoremap <C-L> :nohl<CR><C-L>
nnoremap Q <nop>
nnoremap <silent><Leader>/ :nohlsearch<CR>
nnoremap ; :
map <S-Tab> <C-o><<
nmap <leader>l :set list!<CR>

" NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntax highlight and color schemes
syntax enable
set background=dark
colorscheme base16-ocean

" Allows to change buffer without saving
set hidden
" Command line completion
set wildmenu
" Always show command informations (at the bottom)
set showcmd
" Highligh search result
set hlsearch
set incsearch
" Enable autoindentation
set autoindent
" Remove vim behavior of always putting the cursor at the start of the line
set nostartofline
" Enable ruler...
set ruler
set laststatus=2
set confirm

set showbreak=↪

set nu

set colorcolumn=80

" Tabbing related
set tabstop=2
set shiftwidth=2
set sts=2
set et
set smartindent
set cindent

set showmatch

" Memory buffer
set history=1000
set undolevels=1000

" fuck you swap
set nobackup
set noswapfile

" Forgot sudo ?
cmap w!! w !sudo tee % >/dev/nul

" Invisible
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Wrap
"set wrap
"set tw=80

scriptencoding utf-8
set encoding=utf-8
let g:Powerline_symbols="fancy"

let g:airline_powerline_fonts = 1

set laststatus=2 " Always display the statusline in all windows
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set cursorline
