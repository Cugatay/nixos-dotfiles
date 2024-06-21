vim.opt.nu = true
vim.opt.relativenumber = true

-- vim.opt.shell = 'fish'
-- vim.guicursor = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.mouse = ""

vim.opt.swapfile = false

vim.opt.smartindent = true
-- TODO: This is added new
vim.opt.cindent = true

vim.opt.signcolumn = 'yes'

-- TODO: Test if this works
vim.opt.pumheight = 15

-- vim.opt.synmaxcol = 50000

-- vim.opt.syntax = "off"
-- vim.cmd([[syntax off]])

-- Syntax off if file is too big
-- vim.cmd([[
--   autocmd BufReadPre * if getfsize(expand('%')) > 1000000 | syntax off | endif
-- ]])

-- vim.cmd([[
-- set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--   \,sm:block-blinkwait175-blinkoff150-blinkon175
-- ]])
