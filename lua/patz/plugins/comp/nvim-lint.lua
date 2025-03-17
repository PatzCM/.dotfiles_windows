return {
  "mfussenegger/nvim-lint",
  events = { "BufWritePost", "BufReadPost" },
  config = function() 
    local lint = require("lint")

		-- Event to trigger linters
    lint.linters_by_ft = {
      fish = { "fish" },
      dockerfile = { "hadolint" },
      javascript = { "eslint_d" },
			-- python = { "pylint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    }

		local	lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true})
    
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave"}, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		-- LazyVim extension to easily override linter options
    -- or add custom linters.
    ---@type table<string,table>
    
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file"})

			-- -- Example of using selene only when a selene.toml file is present
      -- selene = {
      --   -- `condition` is another LazyVim extension that allows you to
      --   -- dynamically enable/disable linters based on the context.
      --   condition = function(ctx)
      --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
	end,
}
