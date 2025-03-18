return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "clangd",
          "eslint",
          "intelephense",
          "tailwindcss",
	  "rome",
  }
  })
  end
  },
  {
	  "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup ({})
      lspconfig.html.setup({})
      lspconfig.clangd.setup({})
      lspconfig.eslint.setup ({})
      lspconfig.intelephense.setup ({})
      lspconfig.tailwindcss.setup ({})
      lspconfig.rome.setup ({})
    end
  }
}
