-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
-- require("luasnip").filetype_extend("javascript", { "html" })
-- require("luasnip").filetype_extend("frameworks", { "vue" })

require("luasnip/loaders/from_vscode").load({
  paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})
