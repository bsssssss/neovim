vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local o = vim.opt

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.breakindent = true
o.autoindent = true
o.smartindent = true
o.wrap = false

o.inccommand = "split"

o.relativenumber = true
o.number = true

o.ignorecase = true
o.smartcase = true

o.cursorline = true

o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"
o.fillchars = vim.opt.fillchars + "eob: "

o.listchars = "tab:>-"

o.backspace = "indent,eol,start"

-- o.clipboard:append("unnamedplus")

o.splitright = true
o.splitbelow = true

-- Decrease update time
o.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 500

o.undodir = vim.fn.expand("~/.undodir")
o.undofile = true

o.swapfile = false

o.autoread = true

vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

o.syntax = "on"
o.conceallevel = 0

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

o.laststatus = 3
o.cmdheight = 1
o.showmode = true
o.shortmess = "aOt"
