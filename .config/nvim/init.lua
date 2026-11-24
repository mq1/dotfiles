-- Speed up startup
vim.loader.enable()

-- Options
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key to space
vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4 -- 1 tab = 4 spaces
vim.o.shiftwidth = 4 -- Indentation width
vim.o.cursorline = true -- Highlight current line
vim.o.cmdheight = 0 -- Hide command line when idle
vim.o.showbreak = " ↪ " -- Wrapped line indicator
vim.o.undofile = true -- Persistent undo history
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive search if any caps
vim.o.swapfile = false -- Disable swap files
vim.o.scrolloff = 8 -- Lines of context
vim.o.title = true -- Set terminal emulator title

-- Kinda slow
vim.schedule(function()
	vim.o.spelllang = "en,it" -- Set up spell check (English and Italian)
	vim.o.spell = true -- Enable spell check
	vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
end)

-- Keybindings
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Alternate buffer" })

-- Show cmdline when recording
local group = vim.api.nvim_create_augroup("RecordingCmdheight", { clear = true })
vim.api.nvim_create_autocmd("RecordingEnter", {
	group = group,
	callback = function()
		vim.o.cmdheight = 1
	end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
	group = group,
	callback = function()
		vim.o.cmdheight = 0
	end,
})

-- Install plugins
vim.pack.add({ "https://github.com/mezdelex/unpack.nvim" }, { confirm = false })
