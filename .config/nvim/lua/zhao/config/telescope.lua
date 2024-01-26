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
