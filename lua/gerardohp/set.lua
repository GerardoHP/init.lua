-- nvim/lua/gerardohp/set.lua
vim.opt.guicursor = ""

-- set number relativenumber ruler
-- Line numbers and relative position
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- set autoindent expandtab tabstop=2 shiftwidth=2
-- Indentation and tabs (matching your .vimrc)
vim.opt.autoindent = true        -- Mantiene la indentación al crear nueva línea
vim.opt.expandtab = true         -- Convierte tabs en espacios
vim.opt.tabstop = 4              -- El tabulador mide 4 espacios
vim.opt.shiftwidth = 4           -- La indentación automática usa 4 espacios
vim.opt.shiftwidth = 4           -- La indentación automática usa 4 espacios

-- UI and search behavior
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enable 24-bit RGB color in the TUI (Crucial for Rose Pine to highlight searches)
vim.opt.termguicolors = true

-- Search look
vim.opt.hlsearch = true      -- Highlight all search matches
vim.opt.incsearch = true     -- Move to the first match as you type
vim.opt.ignorecase = true -- Ignore caps while searching
vim.opt.smartcase = true  -- If a cap is written then activates search with caps

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

