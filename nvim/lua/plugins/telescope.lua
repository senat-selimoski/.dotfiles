local keymap = vim.keymap
local config = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.9,
        },
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    },
    pickers = {
      find_files = {
        previewer = true,
      },
      live_grep = {
        previewer = true,
      },
      find_buffers = {
        previewer = true,
      }
    },
  })
end

return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.6',
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim"},
  config = config,
  keys = {
    keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope keymaps"}),
    keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Telescope help tags"}),
    keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files"}),
    keymap.set("n", "<leader>fa", ":Telescope <CR>", { desc = "Telescope builtins"}),
    keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Telescope live grep string under cursor"}),
    keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
  }
}
