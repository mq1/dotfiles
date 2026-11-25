vim.schedule(function()
	vim.pack.add({
		{
			src = "https://github.com/saghen/blink.cmp",
			version = vim.version.range("1.*"),
		},
	}, { confirm = false })

	require("blink.cmp").setup({
		signature = {
			enabled = true,
		},
	})
end)
