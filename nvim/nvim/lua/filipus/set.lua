-- disable netrw at the very start of your init.lua
-- to use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- leader keymap
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- [[ SETS ]]


-- -- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = { tab = '▸\\', eol = '↵', space = '·' }
