require("nvchad.configs.lspconfig").defaults()
-- Get NVChad's capabilities and on_init
local nvlsp = require "nvchad.configs.lspconfig"

-- Python
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
})

-- TypeScript/JavaScript/React (TSX/JSX)
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs" },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

-- HTML
vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  -- Added package.json for better root detection
  root_markers = { "package.json", ".git" },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

-- CSS
vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  -- Added package.json for better root detection
  root_markers = { "package.json", ".git" },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

-- Emmet (Added for HTML suggestions in TSX/JSX)
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
  },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

-- CRITICAL: Enable all configured servers
local servers = {
  "emmet_language_server",
  "pyright",
  "ts_ls",
  "tailwindcss",
  "html",
  "cssls",
  "eslint",
  "jdtls",
  "gopls",
  "rust_analyzer",
  "marksman",
  "bashls",
  "yamlls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
