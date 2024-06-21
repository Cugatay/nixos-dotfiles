-- TODO: Review this

local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        -- ["i"] = {
        --   ["<C-c>"] = '<ESC>',
        -- },
        ["n"] = {
          -- your custom normal mode mappings
          ["n"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.rename,
          -- ["e"] = function()
          -- end,
          -- ["h"] = fb_actions.goto_parent_dir,
          -- ["/"] = function()
          --   vim.cmd('startinsert')
          -- end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<C-o>', function()
  --   -- TODO
  --   no_ignore = false,
  --   -- file_ignore_patterns = { "!**/.env" },
  --   hidden = true
  -- })

  builtin.find_files({
    -- find_command = { 'fd' --[[ , vim.fn.expand("<cword>") ]] },
    no_ignore = false,
    hidden = true
  })
end)

vim.keymap.set('n', '<C-b>', function()
  builtin.buffers({})
end)

vim.keymap.set('n', '<C-f>', function()
  builtin.live_grep()
end)

vim.keymap.set("n", "<leader>b", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
    git_status = false
  })
end)
