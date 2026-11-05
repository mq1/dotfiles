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
vim.o.title = true -- Set terminal window title
vim.o.winborder = "rounded" -- Rounded corners for floating windows
vim.o.spelllang = "en,it" -- Set up spell check (English and Italian)
vim.o.spell = true -- Enable spell check
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard

-- Completion config
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"
vim.o.complete = ".,w,b,kspell"
vim.o.pumborder = "rounded"
vim.o.pumheight = 10
vim.o.pummaxwidth = 80

-- Show cmdline when recording
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- Keybindings --
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Alternate buffer" })

vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua files<CR>", { desc = "Find file" })
vim.keymap.set("n", "<Leader>b", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer" })
vim.keymap.set("n", "<Leader>g", "<Cmd>FzfLua live_grep<CR>", { desc = "Find text" })
vim.keymap.set("n", "<Leader>d", "<Cmd>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics" })

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Explore files" })

-- Plugins --
vim.pack.add({
	"https://github.com/sainnhe/gruvbox-material", -- color scheme
	"https://github.com/nvim-mini/mini.nvim", -- misc
	"https://github.com/j-hui/fidget.nvim", -- notifications
	"https://github.com/stevearc/oil.nvim", -- file explorer
	"https://github.com/ibhagwan/fzf-lua", -- fuzzy search
	"https://github.com/stevearc/conform.nvim", -- code formatter
	"https://github.com/arborist-ts/arborist.nvim", -- tree-sitter manager
	"https://github.com/neovim/nvim-lspconfig", -- lsp configs
	"https://github.com/folke/which-key.nvim", -- keymap hints
	"https://github.com/Saecki/crates.nvim", -- rust crates utility
	"https://github.com/MeanderingProgrammer/render-markdown.nvim", -- in-buffer markdown rendering
}, { confirm = false })

vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")

require("mini.icons").setup()
MiniIcons.tweak_lsp_kind() -- for mini.completion

require("mini.git").setup()
require("mini.diff").setup()
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.indentscope").setup()
require("mini.cursorword").setup()
require("mini.completion").setup()
require("oil").setup()
require("fzf-lua").setup()
require("crates").setup()
require("render-markdown").setup()
require("fidget").setup({ notification = { override_vim_notify = true } })
require("which-key").setup({ preset = "helix" })
require("arborist").setup({ install_popular = false })

-- LSP --
vim.lsp.enable({ "copilot", "lua_ls", "rust_analyzer" })
vim.lsp.inlay_hint.enable()
vim.diagnostic.config({ virtual_text = true })

-- Code formatters --
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

-- Copilot --
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
			vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

			vim.keymap.set(
				"i",
				"<C-F>",
				vim.lsp.inline_completion.get,
				{ desc = "LSP: accept inline completion", buffer = bufnr }
			)
			vim.keymap.set(
				"i",
				"<C-G>",
				vim.lsp.inline_completion.select,
				{ desc = "LSP: switch inline completion", buffer = bufnr }
			)
		end
	end,
})
