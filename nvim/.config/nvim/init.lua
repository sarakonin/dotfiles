-- basic
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.termguicolors = true
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>w', 'w<CR>', { desc = 'Save file'})
vim.opt.clipboard = 'unnamedplus'
