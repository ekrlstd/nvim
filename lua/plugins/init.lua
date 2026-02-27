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
    "sphamba/smear-cursor.nvim",
    opts = {
      max_length = 2,
      max_length_insert_mode = 1,
      vertical_bar_cursor = false, -- or true, matching your actual cursor shape
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = false,
      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,
      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,
      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears and particles will look a lot less blocky.
      legacy_computing_symbols_support = false,
      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,
    },
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
    opts = vim.tbl_deep_extend("force", require "configs.nvimtree", {
      filesystem_watchers = {
        ignore_dirs = {
          "Library",
        },
      },
    }),
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
