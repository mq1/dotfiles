vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
}, { confirm = false })

require("oil").setup()

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Explore files" })
