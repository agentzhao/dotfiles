return {
  -- sessions
  {
    "rmagatti/auto-session",
    keys = {
      { "<Leader>ss", "<cmd>SaveSession<cr>",    "n", desc = "save session" },
      { "<Leader>rs", "<cmd>RestoreSession<cr>", "n", desc = "restore session" },
      { "<Leader>sl", "<cmd>SearchSession<cr>",  "n", desc = "search session" },
    },
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
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
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "zhao",
          path = "/home/zhao/obsidian/zhao",
        },
      },
      templates = {
        subdir = "templates",
      },
      notes_subdir = "zettlekasten",
      daily_notes = {
        folder = "journal",
        date_format = "%Y-%m-%d",
        template = "journal.md"
      },
      completion = {
        nvim_cmp = true,
      },
      finder = "telescope.nvim",
      ui = {
        enable = false,
      }
    },
  }
}
