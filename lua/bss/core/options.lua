vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.breakindent = true
opt.autoindent = true
opt.wrap = false

opt.inccommand = "split"

opt.relativenumber = true
opt.number = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- Decrease update time
opt.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 500

opt.undodir = vim.fn.expand("~/.undodir")
opt.undofile = true

opt.swapfile = false
