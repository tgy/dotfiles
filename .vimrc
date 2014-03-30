" Loading pathogen plugins
" call pathogen#infect()


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'


" Plugins
" Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'jeroenbourgois/vim-actionscript'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplete.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'rking/ag.vim'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1

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
colorscheme jellybeans

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

set colorcolumn=79

" Tabbing related
set tabstop=4
set shiftwidth=4
set sts=4
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

set scrolloff=5

noremap <leader>pp :setlocal paste!<cr>

set wrap
set textwidth=79

hi MatchParen cterm=underline ctermbg=green ctermfg=magenta

" Python & Django
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" put ft=markdown for all .md files
au BufRead,BufNewFile *.md set filetype=markdown

" Git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

" Syntastic
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
