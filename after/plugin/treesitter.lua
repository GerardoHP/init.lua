require'nvim-treesitter'.setup{
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install { "help", "javascript", "typescript", "c", "lua", "rust", "dart", "c_sharp", }
