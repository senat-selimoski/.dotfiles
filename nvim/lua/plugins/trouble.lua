return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require('trouble')
    vim.keymap.set("n", "<leader>tt", trouble.toggle)
    vim.keymap.set("n", "[d", function()
      trouble.next({ skip_groups = true, jump = true })
    end)
    vim.keymap.set("n", "]d", function() 
      trouble.previous({ skip_groups = true, jump = true })
    end)
  end
}
