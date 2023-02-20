-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself: https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- https://github.com/rose-pine/neovim
  use('rose-pine/neovim')

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- https://github.com/nvim-treesitter/playground
  use('nvim-treesitter/playground')

  -- https://github.com/VonHeikemen/lsp-zero.nvim
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  -- https://github.com/akinsho/bufferline.nvim
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- https://github.com/akinsho/toggleterm.nvim
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
  end}

  -- https://github.com/folke/trouble.nvim
  use {
	  "folke/trouble.nvim",
	  requires = "nvim-tree/nvim-web-devicons",
	  config = function()
		  require("trouble").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
		  }
	  end
  }

  -- https://github.com/numToStr/Comment.nvim
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup()
	  end
  }


  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use "lukas-reineke/indent-blankline.nvim"

  -- https://github.com/tanvirtin/vgit.nvim
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- https://github.com/windwp/nvim-autopairs
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }
end)

