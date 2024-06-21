require("LspUI").setup({
  prompt = false
})

-- vim.keymap.set("n", "K", "<CMD>LspUI hover<CR>")
-- vim.keymap.set("n", "<leader>q", "<CMD>LspUI diagnostic next<CR>")
-- vim.keymap.set("n", "<leader>p", "<CMD>LspUI diagnostic prev<CR>")
vim.keymap.set("n", "gr", "<CMD>LspUI rename<CR>")
vim.keymap.set("n", "ga", "<CMD>LspUI code_action<CR>")
