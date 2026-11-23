-- Options --
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set leader key to space
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
vim.o.spelllang = "en,it" -- Set up spell check (English and Italian)
vim.o.spell = true -- Enable spell check
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard

-- Show cmdline when recording
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- Keybindings --
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Alternate buffer" })

vim.keymap.set("n", "<Leader>f", "<Cmd>Pick files<CR>", { desc = "Find file" })
vim.keymap.set("n", "<Leader>b", "<Cmd>Pick buffers<CR>", { desc = "Find buffer" })
vim.keymap.set("n", "<Leader>g", "<Cmd>Pick grep_live<CR>", { desc = "Find text" })
vim.keymap.set("n", "<Leader>d", "<Cmd>Pick diagnostic<CR>", { desc = "Diagnostics" })

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Explore files" })

-- Install and configure plugins --
vim.pack.add({
	"https://github.com/sainnhe/gruvbox-material", -- color scheme
	"https://github.com/nvim-mini/mini.nvim", -- misc
	"https://github.com/j-hui/fidget.nvim", -- notifications
	"https://github.com/stevearc/oil.nvim", -- file explorer
	"https://github.com/lewis6991/gitsigns.nvim", -- git integration
	"https://github.com/stevearc/conform.nvim", -- code formatter
	"https://github.com/nvim-treesitter/nvim-treesitter", -- treesitter
	"https://github.com/neovim/nvim-lspconfig", -- lsp configs
	"https://github.com/folke/which-key.nvim", -- keymap hints
	"https://github.com/Saecki/crates.nvim", -- rust crates utility
	"https://github.com/MeanderingProgrammer/render-markdown.nvim", -- in-buffer markdown rendering
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }, -- code completion
}, { confirm = false })

require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.indentscope").setup()
require("mini.cursorword").setup()
require("mini.pick").setup()
require("mini.extra").setup()
require("oil").setup()
require("crates").setup()
require("render-markdown").setup()
require("which-key").setup({ preset = "helix" })
require("fidget").setup({ notification = { override_vim_notify = true } })

-- Color scheme
vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")

-- Treesitter
local langs = { "rust", "html", "xml", "json", "yaml", "toml", "zsh" }
require("nvim-treesitter").install(langs):pwait(300000)
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

-- LSP
vim.lsp.enable({ "lua_ls", "rust_analyzer" })
vim.lsp.inlay_hint.enable()
vim.diagnostic.config({ virtual_text = true })
require("blink.cmp").setup()

-- Code formatters
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		toml = { "taplo" },
		sh = { "shfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
