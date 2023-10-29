return {
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
    tag = "*", -- Use for stability; omit to  `main` branch for the latest features
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
  }
}