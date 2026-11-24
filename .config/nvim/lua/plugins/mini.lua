return {
	src = "https://github.com/nvim-mini/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.statusline").setup()

		vim.schedule(function()
			require("mini.pairs").setup()
			require("mini.indentscope").setup()
			require("mini.cursorword").setup()
			require("mini.pick").setup()
			require("mini.extra").setup()

			vim.keymap.set("n", "<Leader>f", "<Cmd>Pick files<CR>", { desc = "Find file" })
			vim.keymap.set("n", "<Leader>b", "<Cmd>Pick buffers<CR>", { desc = "Find buffer" })
			vim.keymap.set("n", "<Leader>g", "<Cmd>Pick grep_live<CR>", { desc = "Find text" })
			vim.keymap.set("n", "<Leader>d", "<Cmd>Pick diagnostic<CR>", { desc = "Diagnostics" })
		end)
	end,
}
