-- Define utils functions
local utils = {}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Environment
  use 'danilamihailov/beacon.nvim'

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  }
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({
        previewer = true,
        --path_display = true, -- {'shorten'}
      })
      require("telescope").load_extension("session-lens")
    end
  }


  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }

	use {"lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        buftype_exclude = { "terminal", "help" },
        filetype_exclude = { "alpha" },
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  use {
		'navarasu/onedark.nvim',
		config = function() require('onedark').setup() end
	}

  use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup({
				options = {
					theme = 'onedark'
				},
        sections = {lualine_d = {require('auto-session-library').current_session_name}}
			})
		end
	}

  use {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({enable = false, excluded_filetypes = {"nvim-tree", "toggleterm"}, excluded_buftypes = {"help"}})
    end
  }
  	-- Tools
	use 'sindrets/winshift.nvim' -- Windows
	use 'simonefranza/nvim-conv' -- Converts things
	use 'ap/vim-css-color'  -- Color highlighter
	use 'liuchengxu/vista.vim'
	use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        size = 10,
        open_mapping = [[<C-\>]],
        direction = 'horizontal',
      }
    end
  }

	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { },
        highlight = {
          enable = true,
          disable = { },
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'plugins.nvim-tree' end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-emoji'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'ray-x/lsp_signature.nvim'

  use {
    'hrsh7th/nvim-cmp',
    config = function() require'plugins.nvim-cmp' end
  }

  use {
    'williamboman/nvim-lsp-installer',
    config = function() require'plugins.lsp-installer' end
  }

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-x>"] = 'select_horizontal',
            },
            n = {
              ["<C-x>"] = 'select_horizontal',
            },
          },
        },
      }
    end
	}

	use { -- Commentary
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
	}

	use { -- Jump anywhere
		'phaazon/hop.nvim',
		branch = 'v1', -- optional but strongly recommended
		config = function()
    -- you can configure Hop the way you like here; see :h hop-config
			require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
		end 
	}

	-- Github
	use 'tpope/vim-fugitive'
  use {
    'github/copilot.vim',
    config = function() require 'plugins.copilot' end
  }

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
    tag = 'release',
		config = function()
			require('gitsigns').setup()
		end
	}

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


