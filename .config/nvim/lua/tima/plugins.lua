local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'  -- packer can manage itself

  --   -- GENERAL SETUP:
  use 'windwp/nvim-autopairs' -- autopairs, integrates with both cmp and treesitter, analog to 'windwp/nvim-autopairs'
  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  }
  use 'kyazdani42/nvim-tree.lua' -- file manager inside vim (default on left side), analog to 'scrooloose/nerdtree'

  use 'akinsho/toggleterm.nvim' -- alows to open terminal windows on top of your nvim window

  -- cmp plugins:
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- snippets:
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-copilot'
  use 'mattn/emmet-vim'

  -- LSP:
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'github/copilot.vim'


  use 'hrsh7th/cmp-cmdline'

  -- Telescope:
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = "nvim-lua/plenary.nvim",
  }
  -- use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


  -- DESIGN:

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  use 'xiyaowong/nvim-transparent'
  -- Color Schemas
  use 'rebelot/kanagawa.nvim'

  -- Faster then airline
  use 'nvim-lualine/lualine.nvim' -- status line
  use 'kyazdani42/nvim-web-devicons'

  -- Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }


  -- OTHER:

  use 'szw/vim-maximizer' -- toggle between fullscreen and recover
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'} -- nice render of md files. similar to github
  use 'numToStr/Comment.nvim' -- quickly comment/uncomment files

  -- Tpope's work:
  use 'tpope/vim-rails' -- useful for rails development
  use 'tpope/vim-surround' -- allows to change/add/delete quotes comfy
  use 'tpope/vim-repeat' -- lets use . on plugins operation/complex operations

  -- Git related plugins
  use 'tpope/vim-fugitive' -- git integrator
  use 'lewis6991/gitsigns.nvim' -- adds coloring for changes on the left
  use 'tpope/vim-rhubarb' -- enables :GBrowse from fugitive.vim to open github urls

  -- Misha's work:
  use 'dmyTRUEk/argument-text-object'

  -- ThePrimeagen work:
  use 'ThePrimeagen/harpoon' -- inteligent makrs
  use 'ThePrimeagen/vim-be-good' -- this is fun, game to train

  -- FUN:
  use 'dstein64/vim-startuptime' -- allows to check your startup time using :StartupTime command

  -- use 'lervag/vimtex'
end)
