local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO: add a keymap for :0GlLog or :0Gllog -------------------- IMPORTANT by the way haha

require('lazy').setup({
  -- 'wbthomason/packer.nvim',

  'nvim-lua/plenary.nvim', -- Common utulities

  -- Editor Style
  'folke/tokyonight.nvim',                                    -- Theme
  'nvim-lualine/lualine.nvim',                                -- Statusline
  'kyazdani42/nvim-web-devicons',                             -- File icons
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Highlights
  -- { "catppuccin/nvim", name = "catppuccin" },
  -- 'akinsho/nvim-bufferline.lua'                          -- Bufferline
  -- ----------------------------------------------------------

  -- Language Server
  'neovim/nvim-lspconfig',
  "williamboman/mason.nvim", -- Language servers
  'williamboman/mason-lspconfig.nvim',
  -- 'Cugatay/nvim-cmp'                -- Real version: hrsh7th/nvim-cmp, yioneko's: yioneko/nvim-cmp
  -- 'yioneko/nvim-cmp'
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',            -- nvim-cmp source for neovim's built-in LSP
  "L3MON4D3/LuaSnip",                -- Snippet engine requirement
  'hrsh7th/cmp-buffer',              -- Buffer source for cmp
  'saadparwaiz1/cmp_luasnip',        -- Snippet source
  'rafamadriz/friendly-snippets',    -- Pre-configured vscode-like snippets
  'onsails/lspkind.nvim',            -- VSCode-like Pictograms
  'jose-elias-alvarez/null-ls.nvim', -- Formatter
  { 'j-hui/fidget.nvim' },           -- LSP Updates UI
  { "jinzhongjia/LspUI.nvim", branch = 'legacy' }, -- Better UI
   -- { "jinzhongjia/LspUI.nvim" },      -- Better UI
  -- { 'folke/trouble.nvim','legacy'  config = function()
  --   require("trouble").setup()
  -- end }
  -- { 'simrat39/inlay-hints.nvim', config = function()
  --   require("inlay-hints").setup()
  -- end } -- Satır içinde hint vermek için
  -- ----------------------------------------------------------

  -- Must be coding features
  'windwp/nvim-autopairs',                       -- Auto pair ' { ( [ etc.
  'windwp/nvim-ts-autotag',                      -- Automatically close ts tags -- TODO HEEEYYYY UNCOMMENT THIS WHEN YOU SOLVE TREESITTER
  'leafOfTree/vim-matchtag',                     -- Match and highlight tags (In vimscript)
  'numToStr/Comment.nvim',                       -- Toggle Comment out
  'JoosepAlviste/nvim-ts-context-commentstring', -- Comment out tsx
  'norcalli/nvim-colorizer.lua',                 -- Colorize rgb and hex codes
  -- 'rmagatti/auto-session'                       -- Save sessions automatically
  'kazhala/close-buffers.nvim',                  -- Close buffers without closing split screens
  -- 'ggandor/leap.nvim'                           -- Nvim's mouse answer
  -- 'folke/flash.nvim',
  -- 'mbbill/undotree'                             -- Undotree
  'cbochs/grapple.nvim', -- File Workflow
  'github/copilot.vim',

  -- { 'RishabhRD/nvim-cheat.sh', requires = { 'RishabhRD/popfix' } }


  -- { 'mg979/vim-visual-multi', branch = 'master' } -- Multi cursor
  -- ---------------------------------------------------------

  -- Search globally
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  -- {
  --   'prochri/telescope-all-recent.nvim',
  --   config = function()
  --     require 'telescope-all-recent'.setup {
  --       -- your config goes here
  --     }
  --   end,
  --   requires = { 'kkharji/sqlite.lua' }
  -- }

  -- 'stevearc/oil.nvim'
  -- ---------------------------------------------------------

  -- Git plugins
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  -- "sindrets/diffview.nvim" -- VSCode-like diffview
  -- { 'NeogitOrg/neogit', config = function()
  --   require('neogit').setup {}
  -- end }
  -- 'f-person/git-blame.nvim'
  -- "numToStr/FTerm.nvim" -- This is a floating term plugin, but I'm using it for opening LazyGit
  -- ---------------------------------------------------------

  -- Language Plugins
  -- 'wuelnerdotexe/vim-astro'
  -- 'simrat39/rust-tools.nvim'

  -- 'echasnovski/mini.nvim'
  -- { 'echasnovski/mini.nvim', config = function()
  --   require('mini.animate').setup()
  -- end }
  ({
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  })
})
