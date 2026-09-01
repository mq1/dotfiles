return {
	src = "https://github.com/nvim-mini/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.files").setup()

		vim.keymap.set("n", "<Leader>e", function()
			if MiniFiles.close() == nil then
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end
		end, { desc = "Explore files", silent = true })

		vim.schedule(function()
			require("mini.pairs").setup()
			require("mini.notify").setup()
			require("mini.statusline").setup()
			require("mini.indentscope").setup()
			require("mini.cursorword").setup()
		end)
	end,
}
