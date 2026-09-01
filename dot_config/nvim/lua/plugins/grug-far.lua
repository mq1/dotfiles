return {
	src = "https://github.com/MagicDuck/grug-far.nvim",
	defer = true,
	config = function()
		require("grug-far").setup()
	end,
}
