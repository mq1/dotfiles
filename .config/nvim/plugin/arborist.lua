vim.schedule(function()
	vim.pack.add({
		"https://github.com/arborist-ts/arborist.nvim",
	}, { confirm = false })

	require("arborist").setup({
		install_popular = false,
	})
end)
