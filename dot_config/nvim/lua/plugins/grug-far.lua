return {
	src = "https://github.com/MagicDuck/grug-far.nvim",
	defer = true,
	config = function()
		require("grug-far").setup()

		vim.keymap.set("n", "<Leader>s", "<Cmd>GrugFar<CR>", { desc = "Search & replace", silent = true })
	end,
}
