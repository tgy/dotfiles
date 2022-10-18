vim.lsp.set_log_level 'debug'

vim.cmd("syntax on")
vim.cmd('set nocompatible')
vim.cmd('filetype plugin indent on')
vim.cmd('set clipboard+=unnamedplus')

vim.g.mapleader = ","
vim.g.auto_save = 0
vim.o.syntax = "on"
vim.o.fileencoding = "utf-8"
vim.o.ttyfast = true
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.fileformat = 'unix'
vim.o.lazyredraw = true
vim.wo.colorcolumn = "88"
vim.wo.cursorline = true
vim.wo.number = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.scrolloff = 5
vim.o.ruler = true
vim.o.showbreak='↪'
vim.o.history = 1000
vim.o.undolevels = 1000
vim.wo.wrap = true
vim.o.textwidth = 88

vim.cmd("set iskeyword+=-")

vim.cmd("hi Cursor guifg=black guibg=red")
vim.cmd("hi Cursor2 guifg=red guibg=red")
vim.cmd("set guicursor=n-v-c:block,i-ci-ve:ver25-Cursor2,r-cr:hor20,o:hor50")

-- window option
vim.wo.listchars = 'tab:» ,trail:·,eol:↵,nbsp:⍽'
vim.wo.list = false

vim.cmd('set autoindent')
vim.cmd('set backspace=indent,eol,start')
vim.cmd('set expandtab')
vim.cmd('set shiftwidth=4')
vim.cmd('set shiftround')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set smartindent')
vim.cmd('set cindent')
vim.cmd('set cinoptions=(0,u0,U0,t0,g0,N-s')
vim.cmd('set showmatch')
vim.cmd('set nobackup')
vim.cmd('set noswapfile')
vim.cmd('set formatoptions+=t')

vim.g.slime_target = "tmux"
vim.g.slime_python_ipython = 1
vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}')

vim.cmd('autocmd FileType tex set spell')
vim.cmd('autocmd FileType mail set spell')
vim.cmd('autocmd FileType markdown,html,htmldjango,css,scss setlocal shiftwidth=2')
vim.cmd('autocmd FileType markdown,html,htmldjango,css,scss setlocal sts=2')
vim.cmd('autocmd FileType markdown,html,htmldjango,css,scss setlocal tabstop=2')
vim.cmd('set updatetime=300')
vim.cmd("autocmd BufWritePre * if &ft != 'mail' && &ft != 'gitcommit' | :%s/\\s\\+$//e | endif")
vim.cmd("autocmd Filetype gitcommit setlocal spell textwidth=71 colorcolumn=72")
vim.cmd("autocmd Filetype mail setlocal spell textwidth=71 colorcolumn=72")
vim.cmd("au filetype markdown set formatoptions+=ro")
vim.cmd("au filetype markdown set comments=b:*,b:-,b:+,b:1.,n:>")

vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':set list!<CR>', {noremap = false})
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', {noremap = false})
vim.api.nvim_set_keymap('n', '<C-L>', ':nohl<CR>', {noremap = true})


vim.cmd [[packadd packer.nvim]]
require("packer").startup({
    function()
        use 'lewis6991/impatient.nvim'
        use "wbthomason/packer.nvim"
        use 'scrooloose/nerdcommenter'
        use "norcalli/nvim-colorizer.lua"
        use {
            'kyazdani42/nvim-web-devicons',
            config = function()
                require("nvim-web-devicons").setup {
                    default = true,
                }
            end
        }
        use "kyazdani42/nvim-tree.lua"
        use "nvim-treesitter/nvim-treesitter"
        use 'nvim-treesitter/nvim-treesitter-refactor'
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'sheerun/vim-polyglot'
        use "neovim/nvim-lspconfig"
        use 'rking/ag.vim'
        use "hrsh7th/nvim-compe"
        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
        }
        use "nvim-lua/popup.nvim"
        use "averms/black-nvim"
        use "fisadev/vim-isort"
        use "jlanzarotta/bufexplorer"
        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            ft = { "markdown" },
        })
        use 'jpalardy/vim-slime'
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'
        use "RRethy/nvim-base16"
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup { }
            end
        }
        use {
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup { }
            end
        }
        use {
            "heavenshell/vim-pydocstring",
            run = [[make install]]
        }
        use 'tmhedberg/SimpylFold'
        use 'ggandor/lightspeed.nvim'
        use { "catppuccin/nvim", as = "catppuccin" }
        use 'neomutt/neomutt.vim'
    end,
    config = {
        compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
    }
})

-- require('packer_compiled')
require("impatient")

require("colorizer").setup()

require("nvim-tree").setup {
    view = {
        width = 25,
    }
}




--vim.cmd('colorscheme base16-cupertino')
--vim.cmd('colorscheme base16-gigavolt')

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]


vim.api.nvim_set_keymap('n', '<leader>f', ':lua require("telescope.builtin").find_files()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})

vim.cmd('autocmd FileType python nnoremap <leader>y :Isort<cr> <bar> <cmd>Black<cr>')
vim.cmd('autocmd FileType markdown,javascript,typescript,json nnoremap <leader>y :lua vim.lsp.buf.formatting()<cr>')
vim.cmd('autocmd FileType python nnoremap <leader>d :0,$! python3 -m npdocstring<cr>')
--vim.cmd('autocmd FileType python nmap <silent> <leader>d <Plug>(pydocstring)')
vim.cmd("let g:black#settings = { 'line_length': 88 }")
vim.cmd("let g:pydocstring_formatter = 'numpy'")
vim.cmd("let g:pydocstring_enable_mapping = 0")


vim.cmd("autocmd BufWritePre *.md lua vim.lsp.buf.formatting()")

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- require('lspconfig')["pyright"].setup{
     -- on_attach = on_attach
-- }


require('lspconfig')["pylsp"].setup{
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false, maxLineLength = 88 },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                autopep8 = { enabled = false },
                flake8 = {
                    enabled = true,
                    maxLineLength = 88,
                },
                pylsp_mypy = { enabled = true, live_mode = true },
            },
            configurationSources = { "flake8" },
        }
    }
}

require('lspconfig')["denols"].setup{
    init_options = {
        enable = true,
        lint = true,
        unstable = false,
    },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'markdown',
      'json',
    },
    on_attach = on_attach,
    single_file_support = true,
}

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = true,
        omni = {filetypes = {'tex'}},
    },
}


vim.cmd("let g:SimpylFold_docstring_preview = 0")
vim.cmd("let g:SimpylFold_fold_docstring = 0")
vim.cmd("let g:SimpylFold_fold_import = 0")
vim.cmd("map f za")
vim.cmd("map F zi")
vim.cmd("set foldnestmax=1")
vim.cmd("set foldlevel=0")


--vim.lsp.set_log_level("debug")
