return {
	src = "https://github.com/j-hui/fidget.nvim",
	defer = true,
	config = function()
		require("fidget").setup({
			notification = {
				override_vim_notify = true,
			},
		})
	end,
}
