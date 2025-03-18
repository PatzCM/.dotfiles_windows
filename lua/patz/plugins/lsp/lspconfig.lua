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




-- local lspconfig = require('lspconfig')
--
-- -- Enable Intelephense for PHP
-- lspconfig.intelephense.setup{}
--
-- -- Enable HTML language server
-- lspconfig.html.setup{}
--
-- -- Enable CSS language server
-- lspconfig.cssls.setup{}
--
-- -- Set up completion
-- local cmp = require'cmp'
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--         end,
--     },
--     mapping = {
--         ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--         ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--         ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--         ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         ['<C-e>'] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close(),
--         }),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     },
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'vsnip' }, -- For `vsnip` users.
--     }, {
--         { name = 'buffer' },
--     })
-- })
--
-- -- Setup LSP completion
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- lspconfig.intelephense.setup{
--     capabilities = capabilities,
-- }
-- lspconfig.html.setup{
--     capabilities = capabilities,
-- }
-- lspconfig.cssls.setup{
--     capabilities = capabilities,
-- }
