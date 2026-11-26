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
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
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

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

require("nvim-treesitter").install(languages):await(vim.schedule_wrap(function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		pcall(vim.treesitter.start, buf)
	end
end))
