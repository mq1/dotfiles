return {
	src = "https://github.com/monkoose/neocodeium",
	defer = true,
	config = function()
		require("neocodeium").setup()

		vim.keymap.set("n", "ƒ", function()
			require("neocodeium").accept()
		end, { desc = "Neocodeium accept", silent = true })
	end,
}
