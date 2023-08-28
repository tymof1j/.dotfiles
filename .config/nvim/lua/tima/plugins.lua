-- local fn = vim.fn

-- Automatically install lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_r_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | Lazy
  augroup end
]])
end

-- Install your plugins here
require('lazy').setup({
  --  {
  --   'glacambre/firenvim',
  --   run = function() vim.fn['firenvim#install'](0) end
  -- }
  -- My plugins here

  --   -- GENERAL SETUP:
   'windwp/nvim-autopairs', -- autopairs, integrates with both cmp and treesitter, analog to 'windwp/nvim-autopairs'
   {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
   'kyazdani42/nvim-tree.lua', -- file manager inside vim (default on left side), analog to 'scrooloose/nerdtree'

   'akinsho/toggleterm.nvim', -- alows to open terminal windows on top of your nvim window

  -- cmp plugins:
   'hrsh7th/nvim-cmp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'saadparwaiz1/cmp_luasnip',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-nvim-lua',

  -- snippets:
   'L3MON4D3/LuaSnip',
   'rafamadriz/friendly-snippets',
   'hrsh7th/cmp-copilot',
   'mattn/emmet-vim',

  -- LSP:
   { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- ful status updates for LSP
      'j-hui/fidget.nvim',
    },
  },
   'jose-elias-alvarez/null-ls.nvim',
   'github/copilot.vim',


   'hrsh7th/cmp-cmdline',

  -- Telescope:
   'nvim-lua/popup.nvim',
   {
    'nvim-telescope/telescope.nvim',
    requires = "nvim-lua/plenary.nvim",
  },
  --  'nvim-telescope/telescope-file-browser.nvim'
   'nvim-telescope/telescope-fzy-native.nvim',
  --  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


  -- DESIGN:

  -- Add indentation guides even on blank lines
   'lukas-reineke/indent-blankline.nvim',
   'xiyaowong/nvim-transparent',
  -- Color Schemas
   'rebelot/kanagawa.nvim',

  -- Faster then airline
   'nvim-lualine/lualine.nvim', -- status line
   'kyazdani42/nvim-web-devicons',

  -- Highlight, edit, and navigate code
   {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
   { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },


  -- OTHER:

   'szw/vim-maximizer', -- toggle between fullscreen and recover
   {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}, -- nice render of md files. similar to github
   'numToStr/Comment.nvim', -- quickly comment/uncomment files

  -- Tpope's work:
   'tpope/vim-rails', -- useful for rails development
   'tpope/vim-surround', -- allows to change/add/delete quotes comfy
   'tpope/vim-repeat', -- lets use . on plugins operation/complex operations

  -- Git related plugins
   'tpope/vim-fugitive', -- git integrator
   'lewis6991/gitsigns.nvim', -- adds coloring for changes on the left
   'tpope/vim-rhubarb', -- enables :GBrowse from fugitive.vim to open github urls

  -- Misha's work:
  --  'dmyTRUEk/argument-text-object'

  -- ThePrimeagen work:
   'ThePrimeagen/harpoon', -- inteligent makrs
   'ThePrimeagen/vim-be-good', -- this is fun, game to train

  -- FUN:
   'dstein64/vim-startuptime', -- allows to check your startup time using :StartupTime command
   'Eandrju/cellular-automaton.nvim',

   'lervag/vimtex'
})
require('luasnip.loaders.from_vscode').lazy_load()

