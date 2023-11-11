return {
  "p00f/nvim-ts-rainbow",
  "tpope/vim-repeat",       -- dot-repeat
  "simonefranza/nvim-conv", -- Converts things

  {
    "sindrets/winshift.nvim", -- Windows
    keys = {
      { "<A-w>", "<cmd>WinShift<cr>", "n", desc = "winshift" },
    },
  },

  -- sessions
  {
    "rmagatti/auto-session",
    keys = {
      { "<Leader>ss", "<cmd>SaveSession<cr>",    "n", desc = "save session" },
      { "<Leader>rs", "<cmd>RestoreSession<cr>", "n", desc = "restore session" },
      { "<Leader>sl", "<cmd>SearchSession<cr>",  "n", desc = "search session" },
    },
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
      require("auto-session").setup({
        log_level = "info",
        auto_session_suppress_dirs = { "~/", "~/workspace" },
        auto_save_enabled = false,
      })
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        previewer = true,
        -- path_display = true, -- {'shorten'}
      })
      require("telescope").load_extension("session-lens")
    end,
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
    config = function()
      require("zhao.config.aerial")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { --Explains regular expressions
    "bennypowers/nvim-regexplainer",
    config = function()
      require("regexplainer").setup({
        auto = true,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("zhao.config.whichkey")
    end,
  },
  { -- Run snippets
    "michaelb/sniprun",
    build = "bash ./install.sh",
  },
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("zhao.config.nvim-treesitter")
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = true,
        max_lines = -1,
      }
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("zhao.config.nvim-tree")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = { "nvim-lua/plenary.nvim", "kdheepak/lazygit.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", "n", desc = "find files" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>",              "n", desc = "git files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",              "n", desc = "live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                "n", desc = "buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",              "n", desc = "help tags" },
      { "<leader>cm", "<cmd>Telescope commands<cr>",               "n", desc = "commands" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv",
            "%.mp4", "%.zip" },
          mappings = {
            i = {
              ["<C-x>"] = "select_vertical",
            },
            n = {
              ["<C-x>"] = "select_vertical",
            },
          },
        },
      })
    end,
  },

  -- Debugging
  { -- Commentary
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Github
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", "n", desc = "lazygit" },
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },

  {
    'sindrets/diffview.nvim',
    config = function()
      require("zhao.config.diffview")
    end,
    dependencies = 'nvim-lua/plenary.nvim'
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    tag = "release",
    config = function()
      require("gitsigns").setup()
    end,
  }
}
