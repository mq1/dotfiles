-- typst integration -----------------------------------------------------------

vim.pack.add({
	"https://github.com/chomosuke/typst-preview.nvim",
}, { confirm = false })

vim.lsp.enable({ "tinymist" })

-- formatting
require("conform").formatters_by_ft.typst = { "tinymist" }

-- in-browser preview
require("typst-preview").setup({
	dependencies_bin = {
		tinymist = "tinymist",
	},
})
