return {
	src = "https://github.com/folke/snacks.nvim",
	defer = true,
	config = function()
		require("snacks").setup()

		vim.keymap.set("n", "<Leader>t", function()
			Snacks.terminal()
		end, { desc = "Terminal", silent = true })

		vim.keymap.set("n", "<Leader>l", function()
			Snacks.lazygit()
		end, { desc = "Lazygit", silent = true })
	end,
}
