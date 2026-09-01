return {
	"nvim-mini/mini.nvim",
	priority = 100,
	lazy = false, -- required to enable mini.files early
	config = function()
		require("mini.icons").setup()
		require("mini.files").setup()

		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				require("mini.pairs").setup()
				require("mini.notify").setup()
				require("mini.statusline").setup()
				require("mini.indentscope").setup()
				require("mini.cursorword").setup()
			end,
		})
	end,
	keys = {
		{
			"<Leader>e",
			function()
				if MiniFiles.close() == nil then
					MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
					MiniFiles.reveal_cwd()
				end
			end,
			desc = "Explore files",
			silent = true,
		},
	},
}
