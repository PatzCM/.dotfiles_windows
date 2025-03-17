return {
  "nvim-neo-tree/neo-tree.nvim", -- File explorer
  "lukas-reineke/indent-blankline.nvim", -- Indentation lines
  "tailwindlabs/tailwindcss-intellisense", -- Tailwind CSS support
  config = function()
    -- Configure NeoTree (file explorer)
    require("neo-tree").setup({})
    -- Configure Indentation blankline
    require("indent_blankline").setup({})
  end,
}
