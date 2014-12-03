set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins

" Replay vim sessions (mainly for EPITA students)
"Plugin 'chrisbra/Replay'

" Launch any shell command in a dispatched buffer
Plugin 'tpope/vim-dispatch'

" Text filtering and alignment
Plugin 'godlygeek/tabular'

" Very powerful completion
Plugin 'Valloric/YouCompleteMe'
" Ctags..
Plugin 'fishman/ctags'
" Ctags bar
Plugin 'majutsushi/tagbar'
" Better markdown integration
Plugin 'plasticboy/vim-markdown'
" To show indentation
Plugin 'nathanaelkane/vim-indent-guides'
" Opens a file explorer of the current directory
Plugin 'scrooloose/nerdtree'
" Essential plugin to open files very quickly
Plugin 'kien/ctrlp.vim'
" Compile C/C++ when saving, avoid useless compilations
"Plugin 'scrooloose/syntastic'
" Enhanced C++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" Actionscript syntax highlight support
Plugin 'jeroenbourgois/vim-actionscript'
" Easily surround text with 'whatever you want'
Plugin 'tpope/vim-surround'
" Stylish status line with colors <3
Plugin 'bling/vim-airline'
" Plugin to play with git inside of vim (:Gdiff, for example)
Plugin 'tpope/vim-fugitive'
" <Leader>cc to comment <Leader>cu to uncomment (very useful)
Plugin 'scrooloose/nerdcommenter'
" Automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'
" Very good snippet engine (requires runtime python)
Plugin 'SirVer/ultisnips'
" A bunch of snippets ultisnips compatible
Plugin 'honza/vim-snippets'
" <Leader>be to explore the buffer list, switch-to/delete a buffer
Plugin 'jlanzarotta/bufexplorer'
" :Ag command to find occurences of a string recursively in a directory
Plugin 'rking/ag.vim'
" <Leader><Leader>w to easily jump to some part of the visible code
Plugin 'Lokaltog/vim-easymotion'
" Align stuff
Plugin 'junegunn/vim-easy-align'
" Solarized theme, easy to the eye :)
Plugin 'altercation/vim-colors-solarized'
" Hybrid color scheme
Plugin 'w0ng/vim-hybrid'
" Base-16 colorschemes, super cool
Plugin 'chriskempson/base16-vim'
" Many color schemes
Plugin 'flazz/vim-colorschemes'
" Colorful {} [] :: -> etc. Very useful to see the code more clearly
"Plugin 'oblitum/rainbow'
" Add gvim color support to vim (in terminal)
"Plugin 'vim-scripts/colorsupport.vim'
" Nice white theme GitHub inspired
" Plugin 'ricardovaleriano/vim-github-theme'

" Coding style
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'

" Visually select increasingly larger regions of text
Plugin 'terryma/vim-expand-region'

" YAML support
Plugin 'chase/vim-ansible-yaml'
Plugin 'ingydotnet/yaml-vim'

" Neocomplete Completion with cache (useless if you have YouCompleteMe)
"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

" C/C++ specific
" Allows to switch between .h and .cpp
Plugin 'derekwyatt/vim-fswitch'
" Generate methods and functions prototypes from header
Plugin 'derekwyatt/vim-protodef'
" Autocomplete C/C++ with a clang compiler
" Plugin 'Rip-Rip/clang_complete'
" A bunch of modules that interact with each other to optimize clang_complete
" Plugin 'LucHermitte/vim-clang'
" Plugin 'LucHermitte/clang_indexer'

" Python & Ddjango specific
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'lambdalisue/vim-django-support'
" Better python highlighting
Plugin 'hdima/python-syntax'
" Pep8 python indentation
Plugin 'hynek/vim-python-pep8-indent'

" Better CSS3 syntax highlight
Plugin 'hail2u/vim-css3-syntax'

" Pandoc
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'


"""""""""""""""""""""""""""""""""""""""""""""""""""""

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" STYLE RELATED

" Syntax highlight and color schemes
syntax enable
set background=dark
let g:hybrid_use_Xresources = 1
let base16colorspace=256
colorscheme base16-ocean

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
" Showing them by default
set list!
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

" Neocomplete
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Ctrlp
let g:ctrlp_custom_ignore = '\.o$\|\.app$'

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args='--load-plugins pylint_django'

" Completion plugins
set completeopt-=preview
"let g:clang_auto_select = 1
"let g:clang_snippets = 1
"let g:clang_conceal_snippets = 1
"let g:clang_snippets_engine = "clang_complete"
"let g:clang_user_options = "-std=c++11"
"let g:clang_use_library = 1


" Python highlighting
let python_highlight_all = 1

set conceallevel=0
set concealcursor=vin
let g:tex_conceal=0
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" Enable rainbow style parenthesis
"let g:rainbow_active = 1
"au FileType c,cpp,objc,objcpp,php,java call rainbow#load()

" Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

let g:EclimCompletionMethod = 'omnifunc'

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
" To prevent going further than 80th column
set colorcolumn=80
" Tabbing related
set tabstop=8
set shiftwidth=4
set sts=4
set et
set smartindent
set cindent
" Level of indentation for private/public sections in a class (C++)
set cinoptions+=g0
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
" dunno
set title
" Always display the statusline in all windows
set laststatus=2
" Highlight the current line
set cursorline
" Always keep n lines below the current line
set scrolloff=5
" Wrap text to avoid going further than 80 characters
set wrap
set textwidth=79
set formatoptions+=t
" Enable folding for C/C++
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType cpp setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
map f za
map F zi
set foldnestmax=2
set foldlevel=0

" Git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

" Python & Django
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" put ft=markdown for all .md files
au BufRead,BufNewFile *.md set filetype=markdown
" put ft=muttrc for all .muttrc files
au BufRead,BufNewFile *.muttrc set filetype=muttrc

" Fixing 'font' keyword highlighted in red in CSS files
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END

" Disable syntastic warnings on python filse because Django not supported
autocmd BufNewFile,BufRead *.py let g:syntastic_quiet_messages = { "level": "warnings" }

" Remove unwanted spaces when saving
autocmd BufWritePre * if &ft != 'mail' | :%s/\s\+$//e | endif

" Mails
autocmd Filetype gitcommit setlocal spell textwidth=71 colorcolumn=72
autocmd Filetype mail setlocal spell textwidth=71 colorcolumn=72

" Pandoc support settings
let g:pandoc#syntax#conceal#use = 0

" YCM settings
let g:ycm_global_ycm_extra_conf = '/home/toogy/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Replay settings
" Replay speed
let g:replay_speed = 400
" Allow replay recording
let g:replay_record = 1

" Align function parameters vertically
set cino+=(0

" Enable doxygen syntax
let g:load_doxygen_syntax=1

" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
