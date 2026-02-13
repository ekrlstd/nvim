-- OLD CONFIG:
-- local options = {
--   formatters_by_ft = {
--     lua = { "stylua" },
--     -- css = { "prettier" },
--     -- html = { "prettier" },
--   },
--
--   -- format_on_save = {
--   --   -- These options will be passed to conform.format()
--   --   timeout_ms = 500,
--   --   lsp_fallback = true,
--   -- },
-- }
--
-- return options

-- NEW CONFIG:
local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- Web / Frontend
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    -- Python
    --    python = { "black" },

    -- Go
    go = { "gofmt" },

    -- Rust
    rust = { "rustfmt" },

    -- Bash / Shell
    sh = { "shfmt" },
  },

  -- Optional: format automatically on save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
