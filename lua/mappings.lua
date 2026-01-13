local km = vim.keymap

km.set("i", "jk", "<Esc>", { noremap = true })
km.set("n", "<leader>ff", require("fzf-lua").files, { desc = "FZF Files" })
km.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "FZF Buffers" })
km.set("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "FZF Live Grep" })
km.set("n", "<C-A-f>", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

