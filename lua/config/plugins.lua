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


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself	

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")
    use("nvim-treesitter/playground")
  
    -- Fuzzy search
    use({
      "nvim-telescope/telescope.nvim", tag = "0.1.1",
      -- or                       , branch = "0.1.x",
      requires = { {
          "nvim-lua/plenary.nvim"
      } }
    })

    -- color scheme
    use("habamax/vim-habamax")

	--nvim-web-devicons
	use("ellisonleao/gruvbox.nvim")

    -- LSP and Debugger support
    use({
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
  		  {'hrsh7th/cmp-nvim-lsp'},
  		  {'hrsh7th/cmp-nvim-lua'},
  
  		  -- Snippets
  		  {'L3MON4D3/LuaSnip'},
  		  {'rafamadriz/friendly-snippets'},
  	  }
  
    })

    use("theprimeagen/harpoon")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
