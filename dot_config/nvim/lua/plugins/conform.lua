return {
	src = "https://github.com/stevearc/conform.nvim",
	defer = true,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				toml = { "taplo" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
