return {
	src = "https://github.com/stevearc/oil.nvim",
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Explore files" })
	end,
}
