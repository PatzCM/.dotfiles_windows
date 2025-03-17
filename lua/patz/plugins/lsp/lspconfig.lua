-- lua/patz/plugins/lsp/intelephense.lua

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          setup = function()
            require('lspconfig').intelephense.setup{}
          end,
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              files = {
                associations = { "*.php", "*.blade.php" },
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
