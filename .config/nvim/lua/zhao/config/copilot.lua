vim.cmd [[imap <silent><script><expr> <C-L> copilot#Accept()]]
-- Alt-[ and Alt-] to cycle between suggestions
-- :Copilot to get 10 suggestions

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
