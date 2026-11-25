vim.schedule(function()
	vim.pack.add({
		"https://github.com/Saecki/crates.nvim",
	}, { confirm = false })

	require("crates").setup()
end)
