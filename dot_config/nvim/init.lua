-- Vim options -----------------------------------------------------------------

vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4 -- 1 tab = 4 spaces
vim.o.shiftwidth = 4 -- Indentation width
vim.o.cursorline = true -- Highlight current line
vim.o.cmdheight = 0 -- Hide command line when idle
vim.o.showbreak = " ↪ " -- Wrapped line indicator
vim.o.spell = true -- Enable spell check
vim.o.spelllang = "en,it" -- Spell check (English and Italian)
vim.o.undofile = true -- Persistent undo history
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.ignorecase = true -- Case-insensitive search
vim.o.swapfile = false -- Disable swap files
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.scrolloff = 4 -- Lines of context
vim.o.sidescrolloff = 8 -- Columns of context
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set leader key to space
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.lsp.inlay_hint.enable() -- Enable inlay hints

-- Show cmdline when recording
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- Key bindings ----------------------------------------------------------------

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search", silent = true })
vim.keymap.set("n", "<C-x>", "<Cmd>bdelete<CR>", { desc = "Delete current buffer", silent = true })

-- Install and initialize plugins ----------------------------------------------

vim.pack.add({ "https://github.com/zuqini/zpack.nvim" }, { confirm = false })
require("zpack").setup({ defaults = { confirm = false } })
