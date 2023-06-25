-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Aspect
  use "rebelot/kanagawa.nvim"
  use "folke/tokyonight.nvim"
  use "nvim-tree/nvim-web-devicons" 

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-context");
  use "nvim-treesitter/playground"

  -- Fuzzy search
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    -- or                       , branch = "0.1.x",
    requires = { {
	    "nvim-lua/plenary.nvim"
    } }
  } 

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }


  -- Misc
  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
end)
