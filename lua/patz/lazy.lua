local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- require("mason").setup()
-- require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...


require("lazy").setup({
	{"williamboman/mason.nvim", config = true},
  {"williamboman/mason-lspconfig.nvim", config = true },
  {"neovim/nvim-lspconfig", config = function() require("patz.plugins.lsp.lsp-config")() end},
	{ import = 'patz.plugins'},
  { import = 'patz.plugins.lsp'},
	{ import = 'patz.plugins.ui'},
  { import = 'patz.plugins.edit'},
  { import = 'patz.plugins.extra'},
  { import = 'patz.plugins.nav'},
  { import = 'patz.plugins.comp'},
  -- { import = 'patz.plugins.ai'},
	
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim'}
	}
}){
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip"
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      },
    })
  end,
}

{    
  
	install = { colorscheme = { "catppuccin" } },
  checker = {
    enabled = true,
    notify = false,
  }, -- automatically check for plugin updates
  change_detection = {
    enabled = true,
    notify = false,
  },
}


-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})



