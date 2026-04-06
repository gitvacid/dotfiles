-- soso neovim 12+ config 
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.scrolloff = 18

-- keybindings
local map = vim.keymap.set
map('n', '<leader>w', vim.cmd.write)
map({'n', 'i'}, '<C-s>', vim.cmd.write)
map('n', '<leader>q', vim.cmd.quit)
map('n', '<leader>o', vim.cmd.source)
map('n', '<Esc>', vim.cmd.nohlsearch)
map({'n','v'}, '<leader>y', '"+y')
map({'n','v'}, '<leader>p', '"+p')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-a>', 'gg<S-v>G')
map('n', '<leader>sh', ':sp<CR>')
map('n', '<leader>sv', ':vsp<CR>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<leader>t', ':sp term://bash<CR>')
map('t', '<Esc>', '<C-\\><C-n>')
