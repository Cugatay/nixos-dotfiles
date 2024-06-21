local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local ih = require("inlay-hints")

local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- ih.on_attach(client, bufnr)

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- Fo colemak
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>n", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.diagnostic.goto_prev() end, opts) -- Note: I turned Ctrl-e to Ctrl-p with Karabiner to use that keymap as previous, so to run this one I'm using Ctrl-p

  -----------------------------------
  vim.keymap.set("n", "<leader>f", function()
    vim.diagnostic.open_float()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "<leader>ar", function() vim.lsp.buf.references() end, opts)
  -----------------------------------

  -- vim.keymap.set("n", "<leader>ww", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- NOTE: I'm using rename and code actions in lspui
  -- vim.keymap.set("n", "gr", function() vim.lsp.buf.rename() end, opts)

  -- To enter opened error
  -- map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>
end

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

lspconfig.rust_analyzer.setup {
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
}

lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
}

lspconfig.gleam.setup {
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
}

lspconfig.gopls.setup {
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
}

-- lspconfig.gdscript.setup {
--   -- on_attach = lsp_attach,
--   -- flags = {
--   --   debounce_text_changes = 150,
--   -- }
-- }















-- lspconfig.denols.setup {
--   root_dir = lspconfig.util.root_pattern("deno.json"),
--   single_file_support = false,
--   on_attach = lsp_attach,
--   capabilities = lsp_capabilities,
-- }

-- lspconfig.tailwindcss.setup({
--   settings = {
--     tailwindCSS = {
--       experimental = {
--         classRegex = {
--           ["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"],
--           ["cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)"],
--         },
--       },
--     },
--   },
-- })

-- lspconfig.tailwindcss.setup({
--   root_dir = lspconfig.util.root_pattern("tailwind.config.*"),
--   single_file_support = false,
--   on_attach = lsp_attach,
--   capabilities = lsp_capabilities,
-- })


-- lspconfig.tailwindcss.setup({
-- filetypes = {
--   "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "elixir",
--   "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid",
--   "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass",
--   "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact",
--   "vue", "svelte",
--   "rust"
-- },
-- init_options = {
--   userLanguages = {
--     rust = "html",
--   },
-- },
-- })
