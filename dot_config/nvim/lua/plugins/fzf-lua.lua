return {
	src = "https://github.com/ibhagwan/fzf-lua",
	defer = true,
	config = function()
		require("fzf-lua").setup({ "skim" })

		vim.keymap.set("n", "<Leader>f", function()
			FzfLua.files()
		end, { desc = "Find file", silent = true })

		vim.keymap.set("n", "<Leader>b", function()
			FzfLua.buffers()
		end, { desc = "Find buffer", silent = true })

		vim.keymap.set("n", "<Leader>g", function()
			FzfLua.live_grep_native()
		end, { desc = "Find text", silent = true })

		vim.keymap.set("n", "<Leader>d", function()
			FzfLua.diagnostics_workspace()
		end, { desc = "Diagnostics", silent = true })
	end,
}
