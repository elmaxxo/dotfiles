local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "cpp",
        "rust",
        "bash",
        "markdown",
        "python",
      },
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      -- default
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)

      require("custom.configs.treesitter")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "pyright",
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^4",
  --   ft = { "rust" },
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.rustaceanvim"
  --   end
  -- },
  -- TODO: setup debugging
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-dap",
  --   },
  --   opts = {
  --     handlers = {} -- default
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   init = function()
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "custom.configs.cmp"
    end,
  },
  {
    "APZelos/blamer.nvim",
    lazy = false,
    init = function()
      vim.g.blamer_show_in_visual_modes = false
      vim.g.blamer_show_in_insert_modes  = false
      vim.g.blamer_relative_time = true
      vim.g.blamer_enabled = true
    end
  },
  {
    "pest-parser/pest.vim",
    lazy=false,
    config = function() require('pest-vim').setup {} end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy=false,
    config = function() 
      require'treesitter-context'.setup {
        max_lines = 4,
        trim_scope = 'inner',
        multiline_threshold = 1,
    } end,
  },
}
return plugins
