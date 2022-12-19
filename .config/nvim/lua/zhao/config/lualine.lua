local nvimbattery = {
  function()
    return require("battery").get_status_line()
  end,
  -- color = { fg = colors.violet, bg = colors.bg },
}

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = "false",
  },
  sections = {
    lualine_d = { require("auto-session-library").current_session_name },
    -- lualine_y = nvimbattery, -- not working on wsl
  },
})
