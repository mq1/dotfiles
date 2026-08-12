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
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set leader key to space
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw

-- Key bindings ----------------------------------------------------------------

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search", silent = true })
vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua files<CR>", { desc = "Pick files", silent = true })
vim.keymap.set("n", "<Leader>g", "<Cmd>FzfLua live_grep<CR>", { desc = "Pick matches", silent = true })
vim.keymap.set("n", "<Leader><Leader>", "<Cmd>FzfLua buffers<CR>", { desc = "Pick buffers", silent = true })
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory", silent = true })

vim.keymap.set("i", "ƒ", function() -- <Opt>-F
	require("neocodeium").accept()
end, { desc = "Neocodeium accept", silent = true })

-- Install and intialize plugins (instant) -------------------------------------

vim.pack.add({
	"https://github.com/sainnhe/gruvbox-material", -- color scheme
	"https://github.com/nvim-mini/mini.nvim", -- misc
	"https://github.com/barrettruth/canola.nvim", -- file explorer
}, { confirm = false })

vim.cmd.colorscheme("gruvbox-material")
require("mini.icons").setup()
require("oil").setup()

-- Install and initialize plugins (lazy) ---------------------------------------

vim.schedule(function()
	vim.pack.add({
		"https://github.com/neovim/nvim-lspconfig", -- lsp configs
		"https://github.com/lewis6991/gitsigns.nvim", -- git integration
		"https://github.com/lewis6991/satellite.nvim", -- scrollbar
		"https://codeberg.org/cryptomilk/nvim-pack-ui", -- vim.pack ui
		"https://github.com/stevearc/conform.nvim", -- code formatting
		"https://github.com/Saecki/crates.nvim", -- rust crates utilities
		"https://github.com/chomosuke/typst-preview.nvim", -- typst preview
		"https://github.com/MagicDuck/grug-far.nvim", -- find and replace
		"https://github.com/ibhagwan/fzf-lua", -- fuzzy finder
		"https://github.com/monkoose/neocodeium", -- ai completion
		"https://github.com/saghen/blink.lib", -- completion
		"https://github.com/saghen/blink.cmp", -- completion
		"https://github.com/folke/which-key.nvim", -- keymap hints
	}, { confirm = false })

	-- Set up lsp
	vim.lsp.enable({ "rust_analyzer", "tinymist", "lua_ls", "taplo" })
	vim.lsp.inlay_hint.enable()
	vim.diagnostic.config({ virtual_text = true }) -- Show diagnostics inline

	require("mini.notify").setup()
	require("mini.pairs").setup()
	require("mini.indentscope").setup()
	require("crates").setup()
	require("grug-far").setup()
	require("fzf-lua").setup()

	require("which-key").setup({
		preset = "helix",
		icons = { mappings = false },
	})

	require("mini.statusline").setup()
	local orig_mode = MiniStatusline.section_mode
	MiniStatusline.section_mode = function(args)
		local mode, hl = orig_mode(args)

		local reg = vim.fn.reg_recording()
		if reg ~= "" then
			mode = "recording @" .. reg .. " │ " .. mode
		end

		return mode, hl
	end
	vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, { command = "redrawstatus" })

	require("typst-preview").setup({
		dependencies_bin = { tinymist = "tinymist" },
	})

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	})

	require("neocodeium").setup()

	local cmp = require("blink.cmp")
	cmp.build():pwait()
	cmp.setup()
end)
