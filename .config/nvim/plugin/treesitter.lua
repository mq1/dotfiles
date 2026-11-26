local languages = {
	"rust",
	"json",
	"toml",
	"yaml",
	"bash",
	"html",
	"zsh",
}

local group = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
	group = group,
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
}, { confirm = false })

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = vim.iter(languages):map(vim.treesitter.language.get_filetypes):flatten():totable(),
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})
