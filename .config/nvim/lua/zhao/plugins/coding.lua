return {
  "tpope/vim-repeat",                -- dot-repeat
  "simonefranza/nvim-conv",          -- Converts things
  "hiphish/rainbow-delimiters.nvim", -- Rainbow parentheses
  "nvim-treesitter/nvim-treesitter-context",
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("zhao.config.nvim-treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    'stevearc/aerial.nvim',
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", "n", desc = "toggle aerial" },
      { "{",         "<cmd>AerialPrev<CR>",    "n", desc = "jump to previous" },
      { "}",         "<cmd>AerialNext<CR>",    "n", desc = "jump to next" },
      { "[[",        "<cmd>AerialPrevUp<CR>",  "n", desc = "jump to previous up" },
      { "]]",        "<cmd>AerialNextUp<CR>",  "n", desc = "jump to next up" },
    },
    config = function()
      require("aerial").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- this causes errors on treesitter when opening nvimtree
  -- { --Explains regular expressions
  --   "bennypowers/nvim-regexplainer",
  --   config = function()
  --     require("regexplainer").setup({
  --       auto = true,
  --       disable = { "NvimTree" },
  --     })
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
  { -- Run snippets
    "michaelb/sniprun",
    build = "bash ./install.sh",
  },
  { -- Commentary
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    tag = "release",
    config = function()
      require("zhao.config.gitsigns")
    end,
  },
  {
    "ggandor/leap.nvim", -- successor of lightspeed
    config = function()
      require('leap').add_default_mappings()
      -- Bidireectional search
      -- require('leap').leap { target_windows = { vim.fn.win_getid() } }
    end,
  },
  {
    "ggandor/leap-spooky.nvim",
    config = function()
      require('leap-spooky').setup {
        affixes = {
          -- These will generate mappings for all native text objects, like:
          -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
          -- Special line objects will also be added, by repeating the affixes.
          -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
          -- window.
          -- You can also  'rest' & 'move' as mnemonics.
          remote   = { window = 'r', cross_window = 'R' },
          magnetic = { window = 'm', cross_window = 'M' },
        },
        -- If this option is set to true, the yanked text will automatically be pasted
        -- at the cursor position if the unnamed register is in .
        paste_on_remote_yank = false,
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to  `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to  defaults
      })
    end
  },
  { -- autoclose and autorename tags
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
  },

  { -- autoclose brackets
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  --  {
  --   "github/copilot.vim",
  --   config = function()
  --     require("zhao.config.copilot")
  --   end,
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
          }
        })
      end, 100)
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require("zhao.config.ufo")
    end,
  },
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    config = function()
      require("zhao.config.jupynium")
    end,
  },
  { -- coding in docker container
    'https://codeberg.org/esensar/nvim-dev-container',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require("devcontainer").setup {}
    end,
  },
  {
    -- todo: add formatters
    -- https://github.com/stevearc/conform.nvim#formatters
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<space>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
}
