require("lazy").setup({
    -- Aquí pones tus plugins
    -- Telescope, help open other files 

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- treesiter
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate'
    },

    -- lua/plugins/rose-pine.lua
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        vim.cmd("colorscheme rose-pine")
      end
    },

    -- harpoon
    {
      "theprimeagen/harpoon"
    },

    -- undotre
    {
      "mbbill/undotree"
    },

    -- vim fugitive
    {
      "tpope/vim-fugitive"
    },

    -- lsp-zero
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    }
    -- Puedes agregar más fácilmente así:
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

})
-- nvim/lua/gerardohp/lazy.lua

