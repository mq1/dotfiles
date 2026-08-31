return {
	"ibhagwan/fzf-lua",
	opts = { { "fzf-native", "hide" } },
	keys = {
		{
			"<Leader>f",
			function()
				FzfLua.files()
			end,
			desc = "Find file",
			silent = true,
		},
		{
			"<Leader>b",
			function()
				FzfLua.buffers()
			end,
			desc = "Find buffer",
			silent = true,
		},
		{
			"<Leader>g",
			function()
				FzfLua.live_grep_native()
			end,
			desc = "Find text",
			silent = true,
		},
	},
}
