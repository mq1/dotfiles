return {
	"ibhagwan/fzf-lua",
	opts = { { "fzf-native", "hide" } },
	keys = {
		{
			"<Leader><Leader>",
			function()
				FzfLua.buffers()
			end,
			desc = "Find buffer",
			silent = true,
		},
		{
			"<Leader>f",
			function()
				FzfLua.files()
			end,
			desc = "Find file",
			silent = true,
		},
		{
			"<Leader>t",
			function()
				FzfLua.grep_project()
			end,
			desc = "Find text",
			silent = true,
		},
		{
			"<Leader>s",
			function()
				FzfLua.lsp_live_workspace_symbols()
			end,
			desc = "Find symbol",
			silent = true,
		},
	},
}
