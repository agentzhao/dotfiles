-- Some diagnostics shit
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    severity_limit = "Warning",
  },
  update_in_insert = true,
})

-- might fix something
-- vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- Helper function for config
-- local function c(name)
--   local success, func = pcall(require, "config." .. name)
--   if success then
--     return "require('" .. name .. "').setup({})"
--   end
-- end

-- Rerun PackerCompile everytime plugins.lua is updated
vim.cmd([[
  augroup packer_user_wconfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- themes
  -- use {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --       transparent = false,
  --     })
  --     require("onedark").load()
  --   end,
  -- }

  -- use {
  --   'sam4llis/nvim-tundra',
  --   config = function()
  --     require("config.tundra")
  --   end,
  -- }

  use { "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("zhao.config.catppuccin")
    end,
  }

  -- Environment
  use "danilamihailov/beacon.nvim"

  -- code folding
  use { 'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      require("zhao.config.ufo")
    end,
  }

  use { "justinhj/battery.nvim",
    config = function()
      require("zhao.config.battery")
    end,
  }

  use {
    "rmagatti/auto-session",
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
      require("auto-session").setup({
        log_level = "info",
        auto_session_suppress_dirs = { "~/", "~/workspace" },
        auto_save_enabled = false,
      })
    end,
  }

  use {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        previewer = true,
        -- path_display = true, -- {'shorten'}
      })
      require("telescope").load_extension("session-lens")
    end,
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  }

  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("zhao.config.alpha")
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        -- :set buftype
        buftype_exclude = { "terminal", "help", "nofile" },
        filetype_exclude = { "alpha", "packer" },
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("zhao.config.lualine")
    end,
  }

  use {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({
        enable = false,
        excluded_filetypes = { "nvim-tree", "toggleterm" },
        excluded_buftypes = { "help" },
      })
    end,
  }

  use {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
      require("telescope").load_extension("notify")
    end,
  }

  use { 'mrshmllow/document-color.nvim', config = function()
    require("document-color").setup {
      mode = "background", -- "background" | "foreground"
    }
  end
  }

  use { 'p00f/nvim-ts-rainbow' }

  -- Smooth scrolling
  -- use({
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- })

  -- Tools
  -- use "Djancyp/cheat-sheet" -- cht.sh cheatsheet
  use "tpope/vim-repeat" -- dot-repeat
  use "sindrets/winshift.nvim" -- Windows
  use "simonefranza/nvim-conv" -- Converts things
  use { "ggandor/leap.nvim", -- successor of lightspeed
    config = function()
      require('leap').add_default_mappings()
      -- Bidireectional search
      -- require('leap').leap { target_windows = { vim.fn.win_getid() } }
    end,
  }

  use { "ggandor/leap-spooky.nvim",
    config = function()
      require('leap-spooky').setup {
        affixes = {
          -- These will generate mappings for all native text objects, like:
          -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
          -- Special line objects will also be added, by repeating the affixes.
          -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
          -- window.
          -- You can also use 'rest' & 'move' as mnemonics.
          remote   = { window = 'r', cross_window = 'R' },
          magnetic = { window = 'm', cross_window = 'M' },
        },
        -- If this option is set to true, the yanked text will automatically be pasted
        -- at the cursor position if the unnamed register is in use.
        paste_on_remote_yank = false,
      }
    end,
  }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use {
    'stevearc/aerial.nvim',
    config = function()
      require("zhao.config.aerial")
    end,
  }

  -- use {
  --   "ellisonleao/glow.nvim", -- markdown
  --   config = function()
  --     require('glow').setup({
  --       style = "dark",
  --       border = "rounded",
  --     })
  --   end,
  -- }

  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  }

  use { -- tabline plugin
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons',
      config = function()
        require("zhao.config.barbar")
      end,
    }
  }

  use { --Explains regular expressions
    "bennypowers/nvim-regexplainer",
    config = function()
      require("regexplainer").setup({
        auto = true,
      })
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  }

  -- use({ -- nvim fzf
  --   "vijaymarupudi/nvim-fzf",
  --   config = function()
  --     require("fzf")
  --   end,
  -- })

  use { -- autoclose and autorename tags
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
  }

  use { -- autoclose brackets
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("zhao.config.whichkey")
    end,
  }

  use { -- Run snippets
    "michaelb/sniprun",
    run = "bash ./install.sh",
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("zhao.config.nvim-colorizer")
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
      })
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("zhao.config.nvim-treesitter")
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = true,
        max_lines = -1,
      }
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("zhao.config.nvim-tree")
    end,
  }

  -- LSP
  use "neovim/nvim-lspconfig"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-emoji"
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("zhao.config.luasnip")
    end,
  }
  use "saadparwaiz1/cmp_luasnip"
  use "ray-x/lsp_signature.nvim"
  use "rafamadriz/friendly-snippets"
  use { "simrat39/rust-tools.nvim", --extra tools over rust_analyzer
    config = function()
      require("zhao.config.rust-tools")
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("zhao.config.nvim-cmp")
    end,
  }

  use { "onsails/lspkind.nvim" }

  -- migrate to mason
  use { "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        providers = {
          -- "mason.providers.client", -- if second one doesn't work
          "mason.providers.registry-api",
        }
      }
    end,
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("zhao.config.lsp.mason-lspconfig")
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("zhao.config.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  use { 'akinsho/flutter-tools.nvim',
    config = function()
      require("zhao.config.flutter-tools")
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "kdheepak/lazygit.nvim" },
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
  }

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require("zhao.config.dap")
    end,
  }

  use { -- UI
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui")
    end,
  }

  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  }

  use {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  }

  use { -- Commentary
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Github
  use { "kdheepak/lazygit.nvim",
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  }

  -- use {
  --   "github/copilot.vim",
  --   config = function()
  --     require("zhao.config.copilot")
  --   end,
  -- }

  use {
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
  }

  use { 'sindrets/diffview.nvim',
    config = function()
      require("zhao.config.diffview")
    end,
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    tag = "release",
    config = function()
      require("gitsigns").setup()
    end,
  }

  use({
    'terror/chatgpt.nvim',
    run = 'pip3 install -r requirements.txt'
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
