return {
	src = "https://github.com/arborist-ts/arborist.nvim",
	defer = true,
	config = function()
		require("arborist").setup({
			install_popular = false,
		})
	end,
}
