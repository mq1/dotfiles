-- Options --
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
vim.o.swapfile = false -- Disable swap files
vim.o.scrolloff = 4 -- Lines of context
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.title = true -- Set terminal window title
vim.o.winborder = "rounded" -- Rounded corners for floating windows
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set leader key to space
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw

-- Show cmdline when recording
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- Keybindings --
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search", silent = true })
vim.keymap.set("n", "<C-x>", "<Cmd>bdelete<CR>", { desc = "Delete current buffer", silent = true })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Alternate buffer", silent = true })

vim.keymap.set("n", "<Leader>e", function()
	if MiniFiles.close() == nil then
		MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
		MiniFiles.reveal_cwd()
	end
end, { desc = "Explore files", silent = true })

vim.keymap.set("n", "<Leader>f", function()
	FzfLua.files()
end, { desc = "Find file", silent = true })

vim.keymap.set("n", "<Leader>b", function()
	FzfLua.buffers()
end, { desc = "Find buffer", silent = true })

vim.keymap.set("n", "<Leader>g", function()
	FzfLua.live_grep_native()
end, { desc = "Find text", silent = true })

vim.keymap.set("n", "<Leader>d", function()
	FzfLua.diagnostics_workspace()
end, { desc = "Diagnostics", silent = true })

vim.keymap.set("i", "ƒ", function()
	require("neocodeium").accept()
end, { desc = "Neocodeium accept", silent = true })

-- Plugins --
vim.pack.add({
	"https://github.com/sainnhe/gruvbox-material", -- color scheme
	"https://github.com/nvim-mini/mini.nvim", -- misc
	"https://github.com/lewis6991/satellite.nvim", -- scrollbar
}, { confirm = false })

vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")

require("mini.icons").setup()
require("mini.files").setup()

-- Deferred --
vim.schedule(function()
	-- Options --
	vim.o.spelllang = "en,it" -- Set up spell check (English and Italian)
	vim.o.spell = true -- Enable spell check
	vim.o.clipboard = "unnamedplus" -- Sync with system clipboard

	-- Plugins --
	vim.pack.add({
		"https://github.com/lewis6991/gitsigns.nvim", -- git integration
		"https://github.com/ibhagwan/fzf-lua", -- fuzzy search
		"https://github.com/stevearc/conform.nvim", -- code formatter
		"https://github.com/neovim/nvim-lspconfig", -- lsp configs
		{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }, -- code completion
		"https://github.com/folke/which-key.nvim", -- keymap hints
		"https://github.com/monkoose/neocodeium", -- ai completion
		"https://github.com/Saecki/crates.nvim", -- rust crates utility
		"https://github.com/MagicDuck/grug-far.nvim", -- find and replace
		"https://codeberg.org/cryptomilk/nvim-pack-ui", -- vim.pack gui
	}, { confirm = false })

	require("mini.statusline").setup()
	require("mini.pairs").setup()
	require("mini.notify").setup()
	require("mini.indentscope").setup()
	require("mini.cursorword").setup()

	require("fzf-lua").setup()

	require("blink.cmp").setup()

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			toml = { "taplo" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})

	require("which-key").setup({
		preset = "helix",
		icons = {
			mappings = false,
		},
	})

	require("neocodeium").setup()

	require("grug-far").setup()

	require("crates").setup()

	-- LSP --
	vim.lsp.enable({ "lua_ls", "rust_analyzer" })
	vim.lsp.inlay_hint.enable()
	vim.diagnostic.config({ virtual_lines = { current_line = true } })
end)
