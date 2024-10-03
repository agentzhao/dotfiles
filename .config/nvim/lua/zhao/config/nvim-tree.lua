-- h nvim-tree-default-mappings
-- ctrl+k on file shows details like path, size, modified time, etc

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

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-x>', api.tree.node.open.vertical())
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}

-- local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- Custom opts
require("nvim-tree").setup({
  respect_buf_cwd = true,
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
  update_focused_file = {
    enable = true,
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
