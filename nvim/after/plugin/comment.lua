local comment = require('Comment');

comment.setup({
  toggler = {
    -- line = '<C-c>'
    -- line = '\\c'
    line = '<leader>/'
    -- line = '<leader>c'
  },
  opleader = {
    -- line = '<C-c>'
    -- line = '\\c'
    line = '<leader>/'
    -- line = '<leader>c'
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
