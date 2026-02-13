# Directory Structure

```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── autocmds.lua
│   ├── chadrc.lua
│   ├── configs
│   │   ├── cmp.lua
│   │   ├── conform.lua
│   │   ├── lazy.lua
│   │   ├── lspconfig.lua
│   │   ├── nvimtree.lua
│   │   └── render-markdown.lua
│   ├── mappings.lua
│   ├── options.lua
│   └── plugins
│       ├── image.lua
│       ├── init.lua
│       └── opencode.lua
└── summary.md

4 directories, 16 files
```

# init.lua

```
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
```

# lazy-lock.json

```
{
  "FixCursorHold.nvim": { "branch": "master", "commit": "1900f89dc17c603eec29960f57c00bd9ae696495" },
  "LuaSnip": { "branch": "master", "commit": "3732756842a2f7e0e76a7b0487e9692072857277" },
  "NvChad": { "branch": "v2.5", "commit": "eb209a4a82aecabe609d8206b865e00a760fb644" },
  "base46": { "branch": "v3.0", "commit": "45b336ec52615dd1a3aa47848d894616dd6293a5" },
  "cmp-async-path": { "branch": "main", "commit": "b8aade3a0626f2bc1d3cd79affcd7da9f47f7ab1" },
  "cmp-buffer": { "branch": "main", "commit": "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
  "cmp-cmdline": { "branch": "main", "commit": "d126061b624e0af6c3a556428712dd4d4194ec6d" },
  "cmp-nvim-lsp": { "branch": "main", "commit": "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
  "cmp-nvim-lua": { "branch": "main", "commit": "e3a22cb071eb9d6508a156306b102c45cd2d573d" },
  "cmp_luasnip": { "branch": "master", "commit": "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
  "conform.nvim": { "branch": "master", "commit": "ffe26e8df8115c9665d24231f8a49fadb2d611ce" },
  "friendly-snippets": { "branch": "main", "commit": "572f5660cf05f8cd8834e096d7b4c921ba18e175" },
  "gitsigns.nvim": { "branch": "main", "commit": "5813e4878748805f1518cee7abb50fd7205a3a48" },
  "image.nvim": { "branch": "master", "commit": "446a8a5cc7a3eae3185ee0c697732c32a5547a0b" },
  "indent-blankline.nvim": { "branch": "master", "commit": "005b56001b2cb30bfa61b7986bc50657816ba4ba" },
  "lazy.nvim": { "branch": "main", "commit": "85c7ff3711b730b4030d03144f6db6375044ae82" },
  "lazygit.nvim": { "branch": "main", "commit": "2305deed25bc61b866d5d39189e9105a45cf1cfb" },
  "live-server.nvim": { "branch": "main", "commit": "e8a34bc37fc565c678addbb352a59aa6c1842c2b" },
  "mason.nvim": { "branch": "main", "commit": "57e5a8addb8c71fb063ee4acda466c7cf6ad2800" },
  "menu": { "branch": "main", "commit": "7a0a4a2896b715c066cfbe320bdc048091874cc6" },
  "minty": { "branch": "main", "commit": "aafc9e8e0afe6bf57580858a2849578d8d8db9e0" },
  "neotest": { "branch": "master", "commit": "deadfb1af5ce458742671ad3a013acb9a6b41178" },
  "neotest-java": { "branch": "main", "commit": "bf3f0f9dc972e36c86798208c205c6a575b72f4b" },
  "nvim-autopairs": { "branch": "master", "commit": "d9e44e54384e5b0f3536339c65484f2e41b528e3" },
  "nvim-cmp": { "branch": "main", "commit": "d97d85e01339f01b842e6ec1502f639b080cb0fc" },
  "nvim-dap": { "branch": "master", "commit": "5860c7c501eb428d3137ee22c522828d20cca0b3" },
  "nvim-dap-ui": { "branch": "master", "commit": "cf91d5e2d07c72903d052f5207511bf7ecdb7122" },
  "nvim-dap-virtual-text": { "branch": "master", "commit": "fbdb48c2ed45f4a8293d0d483f7730d24467ccb6" },
  "nvim-jdtls": { "branch": "master", "commit": "f73731b543f5971e0da9665eb1d7ceffe1fde71f" },
  "nvim-lspconfig": { "branch": "master", "commit": "0044d0987ef7e624d04141d0f90d0481fd3c3663" },
  "nvim-nio": { "branch": "master", "commit": "21f5324bfac14e22ba26553caf69ec76ae8a7662" },
  "nvim-tree.lua": { "branch": "master", "commit": "eb33612bff2fb31f54946fb5dcadc89e905e81ec" },
  "nvim-treesitter": { "branch": "master", "commit": "42fc28ba918343ebfd5565147a42a26580579482" },
  "nvim-web-devicons": { "branch": "master", "commit": "8dcb311b0c92d460fac00eac706abd43d94d68af" },
  "opencode.nvim": { "branch": "main", "commit": "b985ecf18a9830c7c6107fd51360180e1fae59d8" },
  "plenary.nvim": { "branch": "master", "commit": "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
  "render-markdown.nvim": { "branch": "main", "commit": "26097a4eb95b391d0308c1b77cce89b28bbc9916" },
  "snacks.nvim": { "branch": "main", "commit": "fe7cfe9800a182274d0f868a74b7263b8c0c020b" },
  "telescope.nvim": { "branch": "master", "commit": "e69b434b968a33815e2f02a5c7bd7b8dd4c7d4b2" },
  "ui": { "branch": "v3.0", "commit": "bea2af0a76c1098fac0988ad296aa028cad2a333" },
  "volt": { "branch": "main", "commit": "620de1321f275ec9d80028c68d1b88b409c0c8b1" },
  "which-key.nvim": { "branch": "main", "commit": "3aab2147e74890957785941f0c1ad87d0a44c15a" }
}
```

# lua/autocmds.lua

```
require "nvchad.autocmds"

```

# lua/chadrc.lua

```
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
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
```

# lua/configs/cmp.lua

```
local cmp = require "cmp"

local options = {
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  },
}

-- Set up command-line completion
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

return options
```

# lua/configs/conform.lua

```
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
```

# lua/configs/lazy.lua

```
return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
```

# lua/configs/lspconfig.lua

```
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
```

# lua/configs/nvimtree.lua

```
local options = {
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Remove the default <CR> mapping
    vim.keymap.del('n', '<CR>', { buffer = bufnr })

    -- Add 'l' to open file/folder
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  end,
}

return options
```

# lua/configs/render-markdown.lua

```
return {
     {
       "MeanderingProgrammer/render-markdown.nvim",
       dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons'
       },
       ft = { "markdown" },
       opts = {},
     }
   }
```

# lua/mappings.lua

```
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
```

# lua/options.lua

```
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
```

# lua/plugins/image.lua

```
return {
  "3rd/image.nvim",
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  opts = {
    processor = "magick_cli",
  },
}
```

# lua/plugins/init.lua

```
return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
    opts = require "configs.cmp",
  },
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
    },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "pyright",
        "jdtls",
        "typescript-language-server",
        "tailwindcss-language-server",
        "emmet_language_server",
        "gopls",
        "rust-analyzer",
        "marksman",
        "yaml-language-server",
        "html-lsp",
        "css-lsp",
        "lua-language-server",
        "bash-language-server",
        "eslint-lsp",
        -- Formatters
        "black",
        "prettier",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>tr", "<cmd>Neotest run<cr>" },
      { "<leader>ti", "<cmd>Neotest output<cr>" },
      { "<leader>ts", "<cmd>Neotest summary<cr>" },
      { "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-java" {
            root_markers = { "pom.xml", "build.gradle", "settings.gradle", "mvnw", ".git", ".project" },
          },
        },
      }
    end,
  },
  -- Add opencode.nvim here
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })

      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })

      vim.keymap.set({ "n", "x" }, "ga", function()
        require("opencode").prompt "@this"
      end, { desc = "Add to opencode" })

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command "session.half.page.up"
      end, { desc = "opencode half page up" })

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command "session.half.page.down"
      end, { desc = "opencode half page down" })

      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  },
}
```

# lua/plugins/opencode.lua

```
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "x" }, "ga", function()
      require("opencode").prompt "@this"
    end, { desc = "Add to opencode" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command "session.half.page.up"
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command "session.half.page.down"
    end, { desc = "opencode half page down" })
    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
}
```

# .stylua.toml

```
column_width = 120
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferDouble"
call_parentheses = "None"
```

