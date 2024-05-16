return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    keys = {
      { "<Leader>n", "<Cmd>Neotree toggle<CR>" }, -- change or remove this line if relevant.
    },
    opts = {
      statusline = true,
    },
}
