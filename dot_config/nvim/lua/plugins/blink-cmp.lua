return {
	src = "https://github.com/saghen/blink.cmp",
	version = vim.version.range("1.*"),
	defer = true,
	config = function()
		require("blink.cmp").setup()
	end,
	dependencies = {
		{
			src = "rafamadriz/friendly-snippets",
			defer = true,
		},
	},
}
