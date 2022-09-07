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

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- Helper function for config
local function c(name)
  local success, func = pcall(require, "config." .. name)
  if success then
    return "require('" .. name .. "').setup({})"
  end
end

-- Rerun PackerCompile everytime plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Environment
  use "danilamihailov/beacon.nvim"
  use { "justinhj/battery.nvim",
    config = function()
      require("config.battery")
    end,
  }

  use {
    "rmagatti/auto-session",
    config = function()
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
      require("config.alpha")
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
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = false,
      })
      require("onedark").load()
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("config.lualine")
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

  -- Smooth scrolling
  -- use({
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- })

  -- Tools
  use "sindrets/winshift.nvim" -- Windows
  use "simonefranza/nvim-conv" -- Converts things
  use "liuchengxu/vista.vim"
  use "ggandor/lightspeed.nvim" -- motions at lightspeed
  use "tpope/vim-repeat" -- dot-repeat
  use "tpope/vim-surround" -- add surround verb
  use "ellisonleao/glow.nvim" -- markdown
  use "Djancyp/cheat-sheet" -- cht.sh cheatsheet

  use { -- tabline plugin
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons',
      config = function()
        require("config.barbar")
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
      require("config.whichkey")
    end,
  }

  use { -- Run snippets
    "michaelb/sniprun",
    run = "bash ./install.sh",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        "vue",
        -- disable because of document-color
        '!css';
        '!html';
        '!tsx';
        '!dart';
        css = { names = true },
      }, {
        mode = "background",
        names = true,
      })
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
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
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "html",
          "java",
          "javascript",
          "json",
          "latex",
          "lua",
          "markdown",
          "php",
          "python",
          "rust",
          "regex",
          "rust",
          "scss",
          "sql",
          "typescript",
          "vue",
          "yaml",
        },
        sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = {},
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("config.nvim-tree")
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
      require("config.luasnip")
    end,
  }
  use "saadparwaiz1/cmp_luasnip"
  use "ray-x/lsp_signature.nvim"
  use "rafamadriz/friendly-snippets"
  use { "simrat39/rust-tools.nvim", --extra tools over rust_analyzer
    config = function()
      require("config.rust-tools")
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.nvim-cmp")
    end,
  }

  -- migrate to mason
  use { "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.lsp.mason-lspconfig")
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
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
      require("config.dap")
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
  use "tpope/vim-fugitive"
  use {
    "github/copilot.vim",
    config = function()
      require("config.copilot")
    end,
  }
  use { 'sindrets/diffview.nvim',
    config = function()
      require("config.diffview")
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
