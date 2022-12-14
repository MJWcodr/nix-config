local set = vim.opt

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- set autochdir to true
set.autochdir = true

-- change leader key to "<Space>"
vim.g.mapleader = " "

-- show line numbers
set.number = true

-- show relative line numbers
set.relativenumber = true

-- show cursor line
set.cursorline = true

-- set max width of line
set.textwidth = 72

-- use formatoptions to wrap text
set.formatoptions = "tcqrn1"
