local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("config.globals")
require("config.options")
require("config.keymaps")

local opts = {
	defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
	install = {
		colorscheme = { "tokyonight", "nightfox" }
	},
	rtp = {
      	---@type string[] list any plugins you want to disable here
      		disabled_plugins = {
        		"gzip",
        		"matchit",
        		"matchparen",
        		"netrwPlugin",
        		"tarPlugin",
        		"tohtml",
        		"tutor",
        		"zipPlugin",
      		},
    	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup({{ import = "plugins"}, {import = "plugins.lsp"}}, opts)
