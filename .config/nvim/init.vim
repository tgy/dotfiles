call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/tpope/vim-dispatch.git'
Plug 'radenling/vim-dispatch-neovim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" language syntax
Plug 'sheerun/vim-polyglot'
Plug 'tshirtman/vim-cython'
" moving around
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'rking/ag.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'jpalardy/vim-slime'
" git
Plug 'tpope/vim-fugitive'
" misc
Plug 'scrooloose/nerdcommenter'
Plug 'embear/vim-localvimrc'
Plug 'junegunn/goyo.vim'
" auto formatting
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
"Plug 'mindriot101/vim-yapf'
Plug 'psf/black'
Plug 'tgy/vim-npdocstring'
Plug 'hynek/vim-python-pep8-indent'
" colors
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'neomake/neomake'
" autocompletion
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', {'for': 'python'}
" folding for Python
Plug 'tmhedberg/SimpylFold'

" Plug 'jiangmiao/auto-pairs'

" latex
Plug 'lervag/vimtex'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }


call plug#end()

set nocompatible
filetype plugin indent on

syntax enable

set background=light
let base16colorspace=256
colorscheme base16-gruvbox-light-soft

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
" Open a new tab easily
nmap <silent> <Leader>t :tabnew<cr>

" Enable mouse usage in vim
set mouse=a

" Use system clipboard for all operations
set clipboard+=unnamedplus

" Allow to change buffer without saving
set hidden
" Always show command informations (at the bottom)
set showcmd
" Highlight search result
set hlsearch
set incsearch
" Enable autoindentation
set autoindent
" make backspace more powerful
set backspace=indent,eol,start
" Remove vim behavior of always putting the cursor at the start of the line
set nostartofline
" Enable ruler...
set ruler
set confirm
" Nice break character
set showbreak=$
" Show line numbers
set nu
" To prevent going further than 80th column
set colorcolumn=80
" Tabbing related
set tabstop=4
set shiftwidth=4
set sts=4
set et
set smartindent
set smarttab
set cindent
" Level of indentation for private/public sections in a class (C++)
"set cinoptions=(0,u0,U0,t0,g0,N-s
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
set formatoptions+=t
set completeopt-=preview
"set completeopt+=noinsert

" Enable folding for C/C++
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType cpp setlocal foldmethod=syntax
"autocmd FileType python setlocal foldmethod=indent
" Python syntax folding
let g:SimpylFold_docstring_preview = 1
map f za
map F zi
set foldnestmax=0
set foldlevel=0

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile *.muttrc set filetype=muttrc
au BufRead,BufNewFile *.conf set filetype=conf

" Remove unwanted spaces when saving
autocmd BufWritePre * if &ft != 'mail' && &ft != 'gitcommit' | :%s/\s\+$//e | endif

" Git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
" Mails
autocmd Filetype gitcommit setlocal spell textwidth=71 colorcolumn=72
autocmd Filetype mail setlocal spell textwidth=71 colorcolumn=72

" Binding for clang-format
autocmd FileType c,cpp,objc map <buffer><Leader>y <Plug>(operator-clang-format)
autocmd FileType python,cython,pyrex,c,cpp setlocal shiftwidth=4
autocmd FileType python,cython,pyrex,c,cpp setlocal sts=4
autocmd FileType python,cython,pyrex,c,cpp setlocal tabstop=4

" Clipboard
noremap <Leader>c :%y+<CR>

" Format all file using yapf
"nnoremap <leader>y :call Yapf()<cr>
nnoremap <leader>y :py3 Black()<cr>
let g:black_linelength = 79
"nnoremap <leader>x :call Npdocstring()<cr>
"autocmd FileType python nnoremap <leader>x :0,$!npdocstring<Cr><C-o>

"let g:python3_host_prog = '/usr/bin/python'

" NerdTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = [ '\.o$','\.app$', '__pycache__', '\.pyc$', '\.acn$', '\.acr$', '\.alg$', '\.aux$', '\.bbl$', '\.blg$', '\.glg$', '\.glo$', '\.gls$', '\.log$', '\.out$', '\.pdf$', '\.sta$', '\.toc$', '\.xdy', '^_minted-report$']

" Fswitch
nmap <silent> <Leader>os :FSHere<cr>
nmap <silent> <Leader>or :FSRight<cr>
nmap <silent> <Leader>oR :FSSplitRight<cr>

let g:syntastic_python_checkers = ['flake8']

" Jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
" disable jedi completion for deoplete-jedi
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources.python = ['jedi']
let g:deoplete#sources#jedi#show_docstring = 1

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:localvimrc_persistent = 2

let g:neomake_python_enabled_makers = ['pep8', 'pylint']
call neomake#configure#automake('nrwi', 500)
let g:neomake_highlight_columns = 0

let g:neomake_cpp_enabled_makers = ['clang++']

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|thirdparty'

map <Leader>m :Make<CR>
inoremap hh <Esc>
inoremap <Esc> <Nop>

set timeoutlen=1000 ttimeoutlen=0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:python_highlight_all = 1
