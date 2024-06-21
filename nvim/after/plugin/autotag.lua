local default_filetypes = {
  'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
  'xml',
  'php',
  'markdown',
  'astro', 'glimmer', 'handlebars', 'hbs'
}

local all_filetypes = vim.tbl_extend('keep', default_filetypes, { 'rust' })

require('nvim-ts-autotag').setup({
  filetypes = all_filetypes,
  enable_close_on_slash = false,

})
