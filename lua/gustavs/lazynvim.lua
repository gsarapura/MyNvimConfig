local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- requires = { {'nvim-lua/plenary.nvim'} }

    -- https://github.com/rose-pine/neovim
    "rose-pine/neovim", name = "rose-pine",

    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

    -- https://github.com/nvim-treesitter/playground
    'nvim-treesitter/playground',
    
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
              -- Disable automatic setup, we are doing it manually
              vim.g.lsp_zero_extend_cmp = 0
              vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
              {'L3MON4D3/LuaSnip'},
            },
            config = function()
              -- Here is where you configure the autocompletion settings.
              local lsp_zero = require('lsp-zero')
              lsp_zero.extend_cmp()

              -- And you can configure cmp even more, if you want to.
              local cmp = require('cmp')
              local cmp_action = lsp_zero.cmp_action()

              cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-d>'] = cmp.mapping.scroll_docs(4),
                  ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                  ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
              })
            end
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = 'LspInfo',
            event = {'BufReadPre', 'BufNewFile'},
            dependencies = {
              {'hrsh7th/cmp-nvim-lsp'},
            },
            config = function()
              -- This is where all the LSP shenanigans will live
              local lsp_zero = require('lsp-zero')
              lsp_zero.extend_lspconfig()

              lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
              end)

              -- (Optional) Configure lua language server for neovim
              -- local lua_opts = lsp_zero.nvim_lua_ls()
              -- require('lspconfig').lua_ls.setup(lua_opts)
            end
        }
    }, 

    -- https://github.com/akinsho/bufferline.nvim
    'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',

    -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim', version = "*", config = true,

    -- https://github.com/folke/trouble.nvim
    -- use {
     --  "folke/trouble.nvim",
     --  requires = "nvim-tree/nvim-web-devicons",
     --  config = function()
        --   require("trouble").setup {
        -- 	  -- your configuration comes here
        -- 	  -- or leave it empty to use the default settings
        -- 	  -- refer to the configuration section below
        --   }
     --  end
    -- }
    "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
        -- opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- }


    -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    --config = function()
    --  require('Comment').setup()
    --end

    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    'JoosepAlviste/nvim-ts-context-commentstring',

    -- https://github.com/nvim-lualine/lualine.nvim
    'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },

    {'nvim-tree/nvim-tree.lua', 
    dependencies = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    },

    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",

    -- https://github.com/tanvirtin/vgit.nvim
    {
        'tanvirtin/vgit.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim'
        }
    },

    -- https://github.com/windwp/nvim-autopairs
    -- use {
    --   "windwp/nvim-autopairs",
    --   config = function() require("nvim-autopairs").setup {} end
    -- }
    -- Neoformat for pretter:
    'sbdchd/neoformat',

    -- https://github.com/mfussenegger/nvim-dap
    -- 'mfussenegger/nvim-dap', dependencies = {"rcarriga/nvim-dap-ui", 'leoluz/nvim-dap-go'}
    'rcarriga/nvim-dap-ui', 
    'mfussenegger/nvim-dap',
    'leoluz/nvim-dap-go'
}) 
-- }, opts)
