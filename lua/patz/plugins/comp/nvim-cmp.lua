local cmp = require("cmp")

return {
  "nvim-cmp",

	cmp.setup({
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer " },
		}),
	})
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "copilot",
      group_index = 2,
      priority = 100,
    })
  end,
}
