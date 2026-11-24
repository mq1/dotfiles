return {
	src = "https://github.com/folke/which-key.nvim",
	defer = true,
	config = function()
		require("which-key").setup({
			preset = "helix",
		})
	end,
}
