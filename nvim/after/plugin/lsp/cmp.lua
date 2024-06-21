local cmp = require('cmp')
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()

-- local cmp_select = { behavior = cmp.SelectBehavior.Select, select = true }
local cmp_select = { select = true }

local mappings = {
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<CR>'] = cmp.mapping.confirm(cmp_select),
  ['<C-f>'] = cmp.mapping.confirm({ select = true }),
  ['ƒ'] = cmp.mapping.confirm({ select = true }),
  ['<C-e>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete()
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert(mappings),
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      -- keyword_length = 3,
      -- group_index = 1,
      -- max_item_count = 15
    },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' }
  }
  ),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      -- default: 'default'
      preset = 'default',

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(_, vim_item)
        return vim_item
      end
    })
  }
})
