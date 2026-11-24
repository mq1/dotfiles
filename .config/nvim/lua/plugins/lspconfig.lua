return {
	src = "https://github.com/neovim/nvim-lspconfig",
	defer = true,
	config = function()
		vim.lsp.enable({ "lua_ls", "rust_glancer" })
		vim.lsp.inlay_hint.enable()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
