return {
  "neovim/nvim-lspconfig",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-emoji",

  "onsails/lspkind.nvim",
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("zhao.config.luasnip")
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  "saadparwaiz1/cmp_luasnip",
  "ray-x/lsp_signature.nvim",
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("zhao.config.nvim-cmp")
    end,
  },


  -- migrate to mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        providers = {
          -- "mason.providers.client", -- if second one doesn't work
          "mason.providers.registry-api",
        }
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("zhao.config.lsp.mason-lspconfig")
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("zhao.config.null-ls")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
  },

  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require("zhao.config.flutter-tools")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "ray-x/lsp_signature.nvim",
    -- event = "VeryLazy",
    config = function()
      require("zhao.config.lsp.lsp_signature")
    end,
  },
}
