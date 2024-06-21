local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
})

local format_group = vim.api.nvim_create_augroup("Format", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.astro" },
  group = format_group,
  -- callback = function()
  --   if vim.fn.exists(':EslintFixAll') == 2 then
  --     -- Run EslintFixAll command
  --     vim.cmd('EslintFixAll')
  --   end
  -- end
  command = "silent! EslintFixAll",
  -- command = 'if exists("EslintFixAll") | exe "EslintFixAll<CR>"  | endif'
})
