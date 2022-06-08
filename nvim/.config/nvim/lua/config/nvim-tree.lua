vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", {
  noremap = true,
  silent = true,
})

vim.g.nvim_ree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- Custom opts
require("nvim-tree").setup({
  respect_buf_cwd = true,
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "icon",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    exclude = {
      filetype = {
        "notify",
        "packer",
        "qf",
      },
      buftype = {
        "terminal",
      },
    },
  },
})
