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


    -- GENERAL SETUP:
    use 'jiangmiao/auto-pairs'
    use 'easymotion/vim-easymotion'
    use 'scrooloose/nerdtree' -- file manager inside vim (default on left side)
    -- use 'iim-scripts/AutoComplPop' -- constant pop-up menu with completions

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

    -- LSP:
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'


    use 'hrsh7th/cmp-cmdline'

    -- Telescope:
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'


    -- DESIGN:

    -- Color Schemas
    use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'

    -- Faster then airline
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'


    -- OTHER:

    use 'szw/vim-maximizer' -- toggle between fullscreen and recover
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'} -- nice render of md files. similar to github

    -- Tpope's work:
    use 'tomtom/tcomment_vim' -- quickly comment/uncomment files
    -- use 'tpope/vim-commentary' -- doesn't seem to work
    use 'tpope/vim-rails' -- useful for rails development
    use 'tpope/vim-surround' -- allows to change/add/delete quotes comfy
    use 'tpope/vim-repeat' -- lets use . on plugins operation/complex operations
    use 'tpope/vim-fugitive' -- git integrator

    -- Misha's work:
    use 'dmyTRUEk/argument-text-object'
    use 'dmyTRUEk/find-and-replace'


    -- FUN:
    use 'ThePrimeagen/vim-be-good' -- game from youtuber to train
end)
