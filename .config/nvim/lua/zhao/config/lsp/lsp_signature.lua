-- TODO: fix lsp_signature

vim.keymap.set({ 'n' }, '<C-k>', function()
  require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })


local opts = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}
require "lsp_signature".setup(opts)
