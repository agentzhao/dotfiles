local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local compare = cmp.config.compare

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ["<C-l>"] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = false,
    -- }),
    -- ['<CR>'] = cmp.mapping({
    --   i = cmp.mapping.confirm({ select = true }),
    --   c = cmp.mapping.confirm({ select = true }),
    -- }),

    -- testing
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     local copilot_keys = vim.fn["copilot#Accept"]()
    --     if copilot_keys ~= "" then
    --       vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --     else
    --       fallback()
    --     end
    --   end
    -- end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "jupynium", priority = 1000 }, -- consider higher priority than LSP
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lsp" }, -- this aint working
    { name = "nvim_lua" },
    { name = "buffer",   keyword_length = 3 },
  },
  -- added from jupynium
  sorting = {
    priority_weight = 1.0,
    comparators = {
      compare.score, -- Jupyter kernel completion shows prior to LSP
      compare.recently_used,
      compare.locality,
    },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      menu = ({             -- showing type in menu
        nvim_lsp = "[LSP]",
        path = "[Path]",
        buffer = "[Buffer]",
        luasnip = "[LuaSnip]",
      }),
      before = function(entry, vim_item) -- for tailwind css autocomplete
        if vim_item.kind == 'Color' and entry.completion_item.documentation then
          local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
          if r then
            local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
            local group = 'Tw_' .. color
            if vim.fn.hlID(group) < 1 then
              vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
            end
            vim_item.kind = "⬤" -- or "⬤■" or anything
            vim_item.kind_hl_group = group
            return vim_item
          end
        end
        -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
        -- or just show the icon
        vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
        return vim_item
      end
    })
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
