-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

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
map('n', '<leader>e', vim.cmd.Ex)
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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{'vyfor/cord.nvim'},
		{
			"vague-theme/vague.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("vague").setup({
					italic = false,
				})
				vim.cmd("colorscheme vague")
			end
		},
		{
			'brenoprata10/nvim-highlight-colors',
			config = function()
				require('nvim-highlight-colors').setup({})
			end
		},
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = false },
})
