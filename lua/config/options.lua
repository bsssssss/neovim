vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
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
opt.fillchars = vim.opt.fillchars + "eob: "

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
opt.laststatus = 3

opt.autoread = true

vim.o.sessionoptions =
	"blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.syntax = "on"
vim.opt.conceallevel = 0
vim.g.vimtex_syntax_conceal_disable = 0

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.opt.cmdheight = 1

vim.opt.showmode = true
-- vim.opt.shortmess = "lfTtoOCFa"
vim.opt.shortmess = "aOt"
