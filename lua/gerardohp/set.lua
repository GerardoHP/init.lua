-- nvim/lua/gerardohp/set.lua

-- set number relativenumber ruler
-- Line numbers and relative position
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true


-- set autoindent expandtab tabstop=2 shiftwidth=2
-- Indentation and tabs (matching your .vimrc)
vim.opt.autoindent = true        -- Mantiene la indentación al crear nueva línea
vim.opt.expandtab = true         -- Convierte tabs en espacios
vim.opt.tabstop = 2              -- El tabulador mide 2 espacios
vim.opt.shiftwidth = 2           -- La indentación automática usa 2 espacios

-- UI and search behavior
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
