local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', ":Telescope<CR>", {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ cwd = "~" })
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  }
}
