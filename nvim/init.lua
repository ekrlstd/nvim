vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Set cursor shapes and blinking for normal usage
vim.opt.guicursor = "n-v-c:block,i:ver25-blinkon500-blinkoff500,r-cr:block"

-- Restore beam cursor with blinking when exiting Neovim
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    -- 'a:ver25-blinkon500-blinkoff500' sets all modes to vertical bar + blinking
    vim.cmd "set guicursor=a:ver25-blinkon500-blinkoff500"
  end,
})

vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["softtabstop"] = 4

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
