local keymap = vim.keymap

vim.g.mapleader = " "

-- To delete words with alt + backspace
keymap.set('i', '<A-BS>', '<C-w>')
keymap.set('c', '<A-BS>', '<C-w>')

-- Window transitions
keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>')
keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>')
keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>')
keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>')

-- Close buffer with C-w
keymap.set('n', '<C-w>', '<cmd>BD this<CR>')

-- Go to last buffer with <leader>w
keymap.set('n', '<leader>w', '<C-^>')

-- keymap.set('n', '<C-w>', function()
--   require('close_buffers').delete({ type = 'this' })
-- end)

-- Line up and down
-- keymap.set('n', '<C-j>', ':m .+1<CR>==')
-- keymap.set('n', '<C-k>', ':m .-2<CR>==')
-- keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
-- keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Don't copy to clipboard when using x
keymap.set('n', 'x', '"_x')

-- Get cursor to the center of the screen when using C-d, and C-u
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '=', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Copy to clipboard
keymap.set('v', "<leader>y", '"+y')
keymap.set('v', "<leader>p", '"_dP')

-- Sorround natively --------------------------------
keymap.set('v', '(', 'c()<ESC>hp')
keymap.set('n', 'c(', 'ci(<ESC>2"_xP`[v`]')

keymap.set('v', '{', 'c{}<ESC>hp')
keymap.set('n', 'c{', 'ci{<ESC>2"_xP`[v`]')

keymap.set('v', '[', 'c[]<ESC>hp')
keymap.set('n', 'c[', 'ci[<ESC>2"_xP`[v`]')

keymap.set('v', '\'', 'c\'\'<ESC>hp')
keymap.set('n', 'c\'', 'ci\'<ESC>2"_xP`[v`]')

keymap.set('v', '"', 'c""<ESC>hp')
keymap.set('n', 'c"', 'ci"<ESC>2"_xP`[v`]')

keymap.set('v', '`', 'c``<ESC>hp')
keymap.set('n', 'c`', 'ci`<ESC>2"_xP`[v`]')
-- --------------------------------------------------

-- Go to mark like ` when pressing '
keymap.set('n', '\'', '`')

keymap.set('n', '<space>', '<nop>')
keymap.set('i', '<C-c>', '<Esc>')
