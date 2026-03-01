require("config.lazy")
require("mappings")

vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
-- set tab to 2 spaces
vim.o.tabstop = 8
vim.o.softtabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = true

-- colorscheme
vim.cmd[[colorscheme tokyonight]]

-- lsp
vim.diagnostic.config({
        virtual_lines = { current_line = true, },
})

vim.lsp.enable('clangd')
vim.lsp.enable('basedpyright')

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

-- Scratch buffer
vim.api.nvim_create_user_command('Scratch', function()
        vim.cmd('new')
        vim.bo.buftype = 'nofile'
        vim.bo.bufhidden = 'hide'
        vim.bo.swapfile = false
end, {})
