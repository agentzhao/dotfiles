return {
  "danilamihailov/beacon.nvim",
  "stevearc/dressing.nvim",   -- Improve default vim UI
  {
    "sindrets/winshift.nvim", -- Windows
    keys = {
      { "<A-w>", "<cmd>WinShift<cr>", "n", desc = "winshift" },
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("zhao.config.whichkey")
    end,
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
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("zhao.config.nvim-tree")
    end,
  },
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
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", "n", desc = "find files" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>",              "n", desc = "git files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",              "n", desc = "live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                "n", desc = "buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",              "n", desc = "help tags" },
      { "<leader>cm", "<cmd>Telescope commands<cr>",               "n", desc = "commands" },
    },
    config = function()
      require("zhao.config.telescope")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = "true",
        },
        sections = {
          lualine_d = { require("auto-session.lib").current_session_name },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = { "alpha" },
        },

        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
      })
    end,
  },
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({
        enable = false,
        excluded_filetypes = { "nvim-tree", "toggleterm" },
        excluded_buftypes = { "help" },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
      require("telescope").load_extension("notify")
    end,
  },
  {
    'mrshmllow/document-color.nvim',
    config = function()
      require("document-color").setup {
        mode = "background", -- "background" | "foreground"
      }
    end
  },
  { -- tabline plugin
    'romgrk/barbar.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    keys = {
      { "<C-h>",     "<cmd>BufferPrevious<CR>",            "n", desc = "previous buffer" },
      { "<C-l>",     "<cmd>BufferNext<CR>",                "n", desc = "next buffer" },
      { "<C-w>",     "<cmd>BufferClose<CR>",               "n", desc = "close buffer" },
      { "<C-p>",     "<cmd>BufferPick<CR>",                "n", desc = "pick buffer" },
      -- sort automatically by...
      { "<space>bb", "<cmd>BufferOrderByBufferNumber<CR>", "n", desc = "sort by buffer number" },
      { "<space>bd", "<cmd>BufferOrderByDirectory<CR>",    "n", desc = "sort by directory" },
      { "<space>bl", "<cmd>BufferOrderByLanguage<CR>",     "n", desc = "sort by language" },
      { "<space>bw", "<cmd>BufferOrderByWindowNumber<CR>", "n", desc = "sort by window number" },
    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("zhao.config.nvim-colorizer")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      require("zhao.config.alpha")
    end,
  }
}
