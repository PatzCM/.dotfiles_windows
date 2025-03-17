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

require("lazy").setup({
  { import = 'patz.plugins'},
  -- { import = 'patz.plugins.lsp'},
  -- { import = 'patz.plugins.ui'},
  -- { import = 'patz.plugins.edit'},
  -- { import = 'patz.plugins.extra'},
  -- { import = 'patz.plugins.nav'},
  -- { import = 'patz.plugins.comp'},
  -- { import = 'patz.plugins.ai'},
}, {    
  install = { colorscheme = { "catppuccin" } },
  checker = {
    enabled = true,
    notify = false,
  }, -- automatically check for plugin updates
  change_detection = {
    enabled = true,
    notify = false,
  }
})
