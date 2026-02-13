-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
---@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "tokyodark",
  hl_override = {
    Normal = { bg = "#0C060D" },
    NormalFloat = { bg = "#0a0a14" },

    -- NvimTree
    NvimTreeNormal = { bg = "#15111a" },
    NvimTreeNormalNC = { bg = "#15111a" },
    NvimTreeEndOfBuffer = { bg = "#15111a" },
    NvimTreeWinSeparator = { fg = "#1a1a2e", bg = "#15111a" },

    -- Telescope
    TelescopeNormal = { bg = "#15111a" },
    TelescopeBorder = { fg = "#2d3145", bg = "#15111a" },
    TelescopePromptNormal = { bg = "#1a1a2e" },
    TelescopePromptBorder = { fg = "#2d3145", bg = "#1a1a2e" },
    TelescopePromptTitle = { fg = "#89ddff", bg = "#1a1a2e" },
    TelescopePreviewTitle = { fg = "#c77dff", bg = "#15111a" },
    TelescopeResultsTitle = { fg = "#67e8f9", bg = "#15111a" },
    TelescopeSelection = { bg = "#1f1b28", fg = "#c8d3f5" },
    TelescopeSelectionCaret = { fg = "#89ddff", bg = "#1f1b28" },
  },
}
M.nvdash = {
  load_on_startup = true,
  header = {
    "           ▄ ▄                   ",
    "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    "                                 ",
    "                                 ",
  },
}
return M
