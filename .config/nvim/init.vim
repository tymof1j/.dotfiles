set nocompatible              " be iMproved, required
filetype off                  " required

" if vim-plug not installed then install:
" if VIM: change it to '~/.vim/autoload/plug.vim' in next and nextnext lines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS:
call plug#begin()
" github copilot
" Plug 'github/copilot.vim'

Plug 'easymotion/vim-easymotion'

" toggle between fullscreen and recover
Plug 'szw/vim-maximizer'

" dima's work:
Plug 'dmyTRUEk/argument-text-object'

Plug 'mattn/emmet-vim'

Plug 'iamcco/markdown-preview.nvim'

" Allows to change/add/delete quotes comfy
Plug 'tpope/vim-surround'
" Lets use . on plugins operation/complex operations
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

"md
Plug 'godlygeek/tabular'

" File Manager inside vim (default on left side):
Plug 'scrooloose/nerdtree'

Plug 'ThePrimeagen/vim-be-good'             "game from youtuber to train
Plug 'iim-scripts/AutoComplPop'             "constant pop-up menu with completions

" Ruby on Rails tools
Plug 'tpope/vim-rails'

" Telescope:
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"completions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'sirver/UltiSnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'hrsh7th/cmp-cmdline'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Color Themes:
Plug 'morhetz/gruvbox'
" faster then vim-airline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

filetype plugin indent on
let g:glow_style = '~/dracula.json'

" DESIGN DECISION:

" sometimes laptop can lack support of those cool ones, so you can use simple
" lines:
    " component_separators = { left = '|', right = '|'},
    " section_separators = { left = '', right = ''},


" setting up a lualine:
lua << END
 require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
    {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

set nofoldenable                " disable folding
syntax enable                   " highlight syntax

" becoming transparent on start
autocmd VimEnter * :hi normal guibg=000000  

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

set number relativenumber       " set line numbers relative to caret
set cursorline                  " highlight cursor line
set showmatch                   " shows matching brackets
" set nowrap                      " Don't wrap lines
set termguicolors
set background=dark
colorscheme gruvbox
set colorcolumn=80
set scrolloff=10

filetype plugin indent on       " turns on 'detection', 'plugin' and 'indent' at once
set noswapfile
set encoding=utf-8              " use utf-8 encoding

" force new splits to open to the right/down. that's a logical place to expect them)
set splitbelow splitright

autocmd InsertEnter * norm zz

" i commented the line bellow in order for Telescope to work properly
" just open vim it directory you need for search and then use your shortcuts as usual
" set autochdir                   " change current dir to file's dir

set completeopt-=preview        " don't show preview if using autocomplete
set laststatus=2                " it controls, when/how to display the status-bar: O=never, 1= {if > than 2 windows}, 2=always


" better search:
set incsearch                   " show search results immediately
set hlsearch                    " highlight found
set ignorecase                  " /word will find 'word' or 'Word' or 'WORD'
set smartcase                   " 11 When 'ignorecase' and 'smartcase' are both on, if pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, '/The'


"'smart ' tabs:
set tabstop=4                   " when indenting with '>', use 4 spaces width
set shiftwidth=4                " On pressing tab, insert 4 spaces
set expandtab                   " use spaces instead of tabs
set autoindent                  " set tabs automatically, when starting new line


" Enable dictionary auto-completion
set complete+=kspell

set completeopt=menuone,longest
set shortmess+=c                " hiding status bar 'insert ...'
"set wildmenu                    " opportunity to have completions in cmd mode with Tab


"remove ESC delay:
set timeoutlen=1000
set ttimeoutlen=0

"use system clipboard
set clipboard+=unnamedplus


let mapleader = " "             " Set leader key:

" REMAPS:

" setting up easymotion:
" disable default mappings
let g:EasyMotion_do_mapping = 0 
" search for 2 characters in any of your splits
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1


" Toggle spell check
map <leader>c :setlocal spell!<CR>

" for fugitive
nmap <leader>gn :diffget //3<CR>
nmap <leader>gt :diffget //2<CR>
nmap <leader>gs : G<CR>
nmap <leader>gl : G log<CR>
nmap <leader>gc : G commit<CR>
nmap <leader>gp : G push<CR>

" for tabs
" create a tab using `tn`
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
" go to previous tab, simply a change from gT
nnoremap tg :tabprev<CR>
" close all tabs except current
nnoremap to :tabo<CR>

" for splits
" toggle maximize for split/recover
nnoremap <leader>mm :MaximizerToggle<CR>
" equalize size of splits
nnoremap <leader>eq <C-w>=

" for Nerd Tree
nnoremap <leader><leader> :NERDTreeToggle<CR>

" find and replace to
nnoremap S :%s//g<Left><Left>

" source config if you are currently viewing him
map <leader>vr :source %<CR>

"for MarkdownPreview
nmap <Leader>m :MarkdownPreview <CR>
nmap <Leader>mp <Plug>MarkdownPreviewStop

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" saving specific
" save (write) file:
nnoremap <leader>w :w <CR>
" save all and quit all:
nnoremap <leader>A :wqa <CR>

" move between windows inside vim:
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>


" Telescope:
" nnoremap gd        :Telescope lsp_definitions <CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>f :Telescope find_files <CR>
nnoremap <leader>t :Telescope live_grep <CR>
nnoremap <leader>b <cmd>Telescope buffers<cr>



" use ukrainian layout in normal mode:
set langmap=аf,б\\,,вd,гu,дl,еt,є',ж\\;,зp,иb,іs,ї],йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ьm,ю.,яz,АF,Б<,ВD,ГU,ДL,ЕT,Є\\",Ж:,ЗP,ИB,ІS,Ї},ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х{,ЦW,ЧX,ШI,ЩO,ЬM,Ю>,ЯZ
" use urk in normal mode after you got used to colemak layout

" nnoremap псс gcc

"ruby
" autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
" autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=!
" autocmd FileType ruby compiler ruby
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
map <Leader>rr :!ruby %<CR>
map <Leader>rn :!node %<CR>
map <Leader>rp :!python3 %<CR>


"function for completion to work
set completeopt=menu,menuone,noselect

lua << EOF
    -- Setup nvim-cmp.
    local cmp = require('cmp')

    cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,

            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,

            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            --['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            --['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            --['<C-e>'] = cmp.mapping({
            --  i = cmp.mapping.abort(),
            --  c = cmp.mapping.close(),
            --}),
        },
        sources = {
            { name = 'nvim_lsp' },
            --{ name = 'path' },
            --{ name = 'vsnip' },   -- For vsnip users.
            --{ name = 'luasnip' }, -- For luasnip users.
            { name = 'ultisnips' }, -- For ultisnips users.
            --{ name = 'snippy' },  -- For snippy users.
            --TODO: patter -> pattern
            --{ name = 'buffer', option = { keyword_patter = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\|[a-zA-Zа-яА-Я]*\)]] } },
        },
        snippet = {
            -- REQUIRED - you MUST specify a snippet engine
            expand = function(args)
              --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              --require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline('/', {
    --  sources = {
    --    { name = 'buffer' }
    --  }
    --})

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline(':', {
    --  sources = cmp.config.sources({
    --    { name = 'path' }
    --  }, {
    --    { name = 'cmdline' }
    --  })
    --})

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['solargraph'].setup {
        capabilities = capabilities
    }
EOF

set nohlsearch                  " disable search highlight
" python3 -m pip install --user --upgrade pynvim
let g:python3_host_prog = '/usr/bin/python3' " -- Set python 3 provider

" auto-pairs. this fixes the issue with using delete key in insert mode for
" config files
let g:AutoPairsMapCh = 0
let g:AutoPairsMultilineClose = 0

" setting up rails-vim plug so :A would jump me to the right test
" file(/requests not /controllers)
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }


" tab is 2 spaces for html & css:
autocmd BufReadPost *.html setlocal shiftwidth=2
autocmd BufReadPost *.html setlocal tabstop=2
autocmd BufReadPost *.css setlocal shiftwidth=2
autocmd BufReadPost *.css setlocal tabstop=2
