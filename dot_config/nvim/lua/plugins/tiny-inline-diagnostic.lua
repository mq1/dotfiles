return {
	src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	defer = true,
	config = function()
		require("tiny-inline-diagnostic").setup({ preset = "powerline" })
	end,
}
