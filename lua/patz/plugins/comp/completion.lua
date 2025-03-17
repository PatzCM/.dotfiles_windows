return {
  "hrsh7th/nvim-cmp", -- Core completion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP completions
  "hrsh7th/cmp-buffer", -- Buffer completions
  "hrsh7th/cmp-path", -- Path completions
  "L3MON4D3/LuaSnip", -- Snippet support
  "saadparwaiz1/cmp_luasnip", -- Snippet completion

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
    })
  end,
}
