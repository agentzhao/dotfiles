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
    config = function()
      require("zhao.config.luasnip")
    end,
  },
  "saadparwaiz1/cmp_luasnip",
  "ray-x/lsp_signature.nvim",
  "rafamadriz/friendly-snippets",
  {
    "simrat39/rust-tools.nvim", --extra tools over rust_analyzer
    config = function()
      require("zhao.config.rust-tools")
    end,
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("zhao.config.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require("zhao.config.flutter-tools")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  }

}
