return {
	src = "https://github.com/neovim/nvim-lspconfig",
	defer = true,
	config = function()
		vim.lsp.enable({ "lua_ls" })
		vim.lsp.inlay_hint.enable()
	end,
}
