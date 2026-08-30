return {
	"stevearc/conform.nvim",
	priority = 25,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			toml = { "taplo" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
