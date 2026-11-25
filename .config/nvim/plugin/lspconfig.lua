vim.schedule(function()
	vim.pack.add({
		"https://github.com/neovim/nvim-lspconfig",
	}, { confirm = false })

	vim.lsp.enable({ "lua_ls", "rust_glancer" })
	vim.lsp.inlay_hint.enable()

	vim.diagnostic.config({
		virtual_text = true,
	})
end)
