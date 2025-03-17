local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	{ import = 'patz.plugins' },
	{ import = 'patz.plugins.lsp'},
	{ import = 'patz.plugins.ui'},
	{ import = 'patz.plugins.edit'},
	{ import = 'patz.plugins.extra'},
	{ import = 'patz.plugins.nav'},
	{ import = 'patz.plugins.comp'},
	{ import = 'patz.plugins.ai'},
},    
  install = { colorscheme = { "catppuccin" } 
  {
  checker = {
	  enabled = true,
	  notify = false,	
}, -- automatically check for plugin updates

 change detection = {
	 enabled = true,
	 notify = false,
 },
 }
})
