require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Terminal
map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle horizontal terminal" })

-- map({ "n", "t" }, "<C-t>", function()
--   require("nvchad.term").toggle {
--     pos = "float",
--     row = 0.3,
--     col = 0.25,
--     width = 0.5,
--     height = 0.4,
--     id = "floatTerm",
--   }
-- end, { desc = "Toggle floating terminal" })

-- Nvim-tree
vim.keymap.del("n", "<C-n>") -- Remove the default Ctrl+n binding
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
