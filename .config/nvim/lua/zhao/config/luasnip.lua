-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
-- require("luasnip").filetype_extend("javascript", { "html" })
require("luasnip").filetype_extend("vue", { "html", "javascript", "css" })
require("luasnip").filetype_extend("javascript", { "react", "css" })

-- require("luasnip/loaders/from_vscode").load({
--   paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
-- })
require("luasnip.loaders.from_vscode").lazy_load()
