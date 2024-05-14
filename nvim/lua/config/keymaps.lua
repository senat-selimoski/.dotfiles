local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Navigation
-- keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
-- keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)
keymap.set("i", "jj", "<Esc>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Management
keymap.set("n", "<leader>sh", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sv", ":split<CR>", opts)
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

