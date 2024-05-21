return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require('mason')

    local lsp_config = require('mason-lspconfig')

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    })

    lsp_config.setup({
      ensure_installed = {
        "clangd",
        "cssls",
        "emmet_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "prismals",
        "pyright",
        "pylsp",
        "rust_analyzer",
        "spectral",
        "sqlls",
        "somesass_ls",
        "tailwindcss",
        "tsserver",
        "yamlls",
        "zls"
      },
      automatic_installation = true,
    })
  end
}
