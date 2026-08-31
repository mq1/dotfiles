return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		vim.lsp.enable({ "lua_ls" })
	end,
}
