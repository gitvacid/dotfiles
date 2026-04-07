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
vim.o.winborder = "bold"
vim.o.signcolumn = "yes"

-- keybindings
local map = vim.keymap.set
map('n', '<leader>e', vim.cmd.Ex)
map('n', '<leader>w', vim.cmd.write)
map('n', '<leader>q', vim.cmd.quit)
map('n', '<leader>o', vim.cmd.source)
map('n', '<Esc>', vim.cmd.nohlsearch)

map({'n', 'i'}, '<C-s>', ':w<CR>')
map('n', '<C-a>', 'gg<S-v>G')

map({'n','v'}, '<leader>y', '"+y')
map({'n','v'}, '<leader>p', '"+p')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

map('n', '<leader>sh', ':sp<CR>')
map('n', '<leader>sv', ':vsp<CR>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')

map('n', '<leader>t', ':sp term://bash<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

vim.pack.add({
  "https://github.com/vague-theme/vague.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors", 
  "https://github.com/vyfor/cord.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

require("cord").setup({})
-- colors
require("vague").setup({
	italic = false,
})
require('nvim-highlight-colors').setup({})
vim.cmd("colorscheme vague")


-- lsp & stuff
vim.lsp.enable({
	"clangd",
})
vim.cmd[[set completeopt+=menuone,noselect,popup]]
-- grabbed it straight from the docs
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
