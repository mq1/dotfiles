return {
	"nvim-mini/mini.nvim",
	priority = 100,
	lazy = false, -- required to enable mini.files early
	config = function()
		require("mini.icons").setup()
		require("mini.notify").setup()
		require("mini.pairs").setup()
		require("mini.statusline").setup()
		require("mini.files").setup()
		require("mini.indentscope").setup()
	end,
	keys = {
		{
			"<Leader>e",
			function()
				if MiniFiles.close() == nil then
					MiniFiles.open()
				end
			end,
			desc = "Explore files",
			silent = true,
		},
	},
}
