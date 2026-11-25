vim.schedule(function()
	vim.pack.add({
		"https://github.com/stevearc/conform.nvim",
	}, { confirm = false })

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			toml = { "taplo" },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end)
