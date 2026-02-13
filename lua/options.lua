require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline

-- Relative lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable inline diagnostics (virtual text)
vim.diagnostic.config {
  virtual_text = {
    spacing = 2,
    prefix = "●", -- or "■", "▎", ""
    severity = { min = vim.diagnostic.severity.HINT }, -- show all severities
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- set true if you want in insert mode
}
