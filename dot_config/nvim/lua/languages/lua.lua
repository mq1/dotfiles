-- lua integration -------------------------------------------------------------

vim.lsp.enable({ "lua_ls" })

-- formatting
require("conform").formatters_by_ft.lua = { "stylua" }
