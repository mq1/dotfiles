return {
	src = "https://github.com/mrcjkb/rustaceanvim",
	defer = true,
	dependencies = {
		{
			src = "https://github.com/Saecki/crates.nvim",
			defer = true,
			config = function()
				require("crates").setup()
			end,
		},
	},
}
