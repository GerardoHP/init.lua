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
    }

    -- Puedes agregar más fácilmente así:
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

})
