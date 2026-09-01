return {
	src = "https://github.com/ibhagwan/fzf-lua",
	defer = true,
	config = function()
		require("fzf-lua").setup({ { "fzf-native", "hide" } })

		vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua files<CR>", { desc = "Find file", silent = true })
		vim.keymap.set("n", "<Leader>b", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer", silent = true })
		vim.keymap.set("n", "<Leader>g", "<Cmd>FzfLua live_grep_native<CR>", { desc = "Find text", silent = true })
	end,
}
