-- rust integration ------------------------------------------------------------

vim.pack.add({
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/Saecki/crates.nvim",
}, { confirm = false })

-- toml lsp
vim.lsp.enable({ "taplo" })

-- formatting
local conform = require("conform")
conform.formatters_by_ft.rust = { "rustfmt" }
conform.formatters_by_ft.toml = { "taplo" }

-- crate utilities
require("crates").setup()
