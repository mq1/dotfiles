return {
	src = "https://github.com/MagicDuck/grug-far.nvim",
	defer = true,
	config = function()
		require("grug-far").setup()

		vim.keymap.set("n", "<Leader>sr", "<Cmd>GrugFar<CR>", { desc = "Search & replace", silent = true })
		vim.keymap.set(
			"n",
			"<Leader>sf",
			"<Cmd>GrugFarWithin<CR>",
			{ desc = "Search & replace (current file)", silent = true }
		)
	end,
}
