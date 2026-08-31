return {
	"nvim-mini/mini.nvim",
	priority = 100,
	lazy = false, -- required to enable mini.starter and mini.files early
	config = function()
		local starter = require("mini.starter")
		starter.setup({
			items = {
				starter.sections.recent_files(nil, true),
			},
		})

		require("mini.icons").setup()
		require("mini.notify").setup()
		require("mini.pairs").setup()
		require("mini.statusline").setup()
		require("mini.files").setup()
		require("mini.indentscope").setup()
		require("mini.cursorword").setup()
	end,
	keys = {
		{
			"<Leader>e",
			function()
				if MiniFiles.close() == nil then
					local buf_name = vim.api.nvim_buf_get_name(0)

					if buf_name ~= "" and (vim.fn.filereadable(buf_name) == 1 or vim.fn.isdirectory(buf_name) == 1) then
						MiniFiles.open(buf_name, false)
						MiniFiles.reveal_cwd()
					else
						MiniFiles.open(nil, false)
					end
				end
			end,
			desc = "Explore files",
			silent = true,
		},
	},
}
