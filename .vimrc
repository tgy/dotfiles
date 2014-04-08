set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins

" Opens a file explorer of the current directory
Bundle 'scrooloose/nerdtree'
" Essential plugin to open files very quickly
Bundle 'kien/ctrlp.vim'
" Compile C/C++ when saving, avoid useless compilations
Bundle 'scrooloose/syntastic'
" Actionscript syntax highlight support
Bundle 'jeroenbourgois/vim-actionscript'
" Easily surround text with 'whatever you want'
Bundle 'tpope/vim-surround'
" Stylish status line with colors <3
Bundle 'bling/vim-airline'
" Plugin to play with git inside of vim (:Gdiff, for example)
Bundle 'tpope/vim-fugitive'
" <Leader>cc to comment <Leader>cu to uncomment (very useful)
Bundle 'scrooloose/nerdcommenter'
" Automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
" Very good snippet engine (requires runtime python)
Bundle 'SirVer/ultisnips'
" A bunch of snippets ultisnips compatible
Bundle 'honza/vim-snippets'
" <Leader>be to explore the buffer list, switch-to/delete a buffer
Bundle 'jlanzarotta/bufexplorer'
" :Ag command to find occurences of a string recursively in a directory
Bundle 'rking/ag.vim'
" <Leader><Leader>w to easily jump to some part of the visible code
Bundle 'Lokaltog/vim-easymotion'
" Allows to switch between .h and .cpp
Bundle "derekwyatt/vim-fswitch"
" Autocomplete C/C++ with a clang compiler
Bundle 'Rip-Rip/clang_complete'
" A bunch of modules that interact with each other to optimize clang_complete
Bundle 'LucHermitte/vim-clang'
Bundle 'LucHermitte/clang_indexer'
" Colorful {} [] :: -> etc. Very useful to see the code more clearly
" Bundle 'oblitum/rainbow'

" Disabled plugins

" Add gvim color support to vim (in terminal)
" Bundle 'vim-scripts/colorsupport.vim'
" Nice white theme GitHub inspired
" Bundle 'ricardovaleriano/vim-github-theme'

"""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""

" STYLE RELATED

" Syntax highlight and color schemes
syntax enable
set background=dark
colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" MAPPINGS

" Changing <Leader>
let mapleader=","

" Remove the highlighted content after a search
nnoremap <C-L> :nohl<CR><C-L>
" Remove this useless interface when you type Q by error
nnoremap Q <nop>
" Remap ; to : so that you don't have to press <SHIFT> to get the vi command
nnoremap ; :
" Toggle showing the invisible characters
nmap <leader>l :set list!<CR>
" Move text and rehighlight -- vim tip_id=224
" vnoremap > ><CR>gv
" vnoremap < <<CR>gv 
" Open a new tab easily
nmap <silent> <Leader>t :tabnew<cr>
" Forgot sudo ?
cmap w!! w !sudo tee % >/dev/nul
" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" PLUGINS SPECIFIC

" Ctrlp
let g:ctrlp_custom_ignore = '\.o$\|\.app$'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.o$','\.app$']

"" Powerline & Airline
scriptencoding utf-8
set encoding=utf-8
let g:Powerline_symbols="fancy"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Fswitch
nmap <silent> <Leader>os :FSHere<cr>
nmap <silent> <Leader>or :FSRight<cr>
nmap <silent> <Leader>oR :FSSplitRight<cr>

" Syntastic
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_cpp_include_dirs = ['src']
let g:syntastic_cpp_compiler_options = '-std=c++11'


" Completion plugins
set completeopt-=preview
let g:clang_auto_select = 1
let g:clang_snippets = 1
let g:clang_conceal_snippets = 1
let g:clang_snippets_engine = "clang_complete"
let g:clang_user_options = "-std=c++11"
let g:clang_use_library = 1
set conceallevel=2
set concealcursor=vin
let g:tex_conceal=0
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" Enable rainbow style parenthesis
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL SETTINGS

" Allow to change buffer without saving
set hidden
" Command line completion
set wildmenu
" Always show command informations (at the bottom)
set showcmd
" Highlight search result
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
" Nice break character
set showbreak=↪
" Show line numbers
set nu
" To prevent going further than 79th column
set colorcolumn=79
" Tabbing related
set tabstop=4
set shiftwidth=4
set sts=4
set et
set smartindent
set cindent
" When matching something, cursor jumps between results
set showmatch
" Memory buffer
set history=1000
set undolevels=1000
" fuck you swp
set nobackup
set noswapfile
" Invisible
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
" Always display the statusline in all windows
set laststatus=2
" Highlight the current line
set cursorline
" Always keep n lines below the current line
set scrolloff=5
" Wrap text to avoid going further than 79 characters
set wrap
set textwidth=79
" Enable folding for C/C++
" autocmd FileType c setlocal foldmethod=syntax
" autocmd FileType cpp setlocal foldmethod=syntax

" Git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
" Python & Django
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" put ft=markdown for all .md files
au BufRead,BufNewFile *.md set filetype=markdown

