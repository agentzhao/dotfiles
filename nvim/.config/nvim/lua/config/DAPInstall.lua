local dap_install = require("dap-install")

dap_install.setup({
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config("python", {})
dap_install.config("ccppr_vsc", {})
dap_install.config("chrome", {})

-- local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
-- for _, debugger in ipairs(dbg_list) do
--   dap_install.config(debugger)
-- end
