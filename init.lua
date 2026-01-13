require("config.lazy")
require("mappings")

vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
-- set tab to 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- lsp
vim.diagnostic.config({
	virtual_lines = { current_line = true, },
})
vim.lsp.enable('clangd')
-- enable autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-l>', function() vim.lsp.completion.get() end)
		end
    -- Goto symbol definition
    vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { buffer = ev.buf, desc = "LSP Definition" })
	end,
})
