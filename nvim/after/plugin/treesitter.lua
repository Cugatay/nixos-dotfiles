local ts = require('nvim-treesitter.configs')

ts.setup {
  ensure_installed = { "lua", "vim", --[[ "help", ]] "javascript", "typescript", "rust", "go", "markdown", "markdown_inline" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    disable = function(lang, bufnr) -- Disable highlight in big files
      if vim.fn.empty(vim.fn.glob(vim.fn.expand('%:p'))) == 1 then
        return true
      end
      if vim.fn.getfsize(vim.fn.expand('%:p')) > 100000 then
        return true
      end
      return false
    end,
    additional_vim_regex_highlighting = false,
  },

  -- Plugins
  -- autotag = {
  --   enable = true,
  -- },
}

vim.g.skip_ts_context_commentstring_module = true
