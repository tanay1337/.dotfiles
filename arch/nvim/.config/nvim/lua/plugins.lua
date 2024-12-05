-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"nmac427/guess-indent.nvim",
	"lewis6991/gitsigns.nvim",
	"navarasu/onedark.nvim",
	"mbbill/undotree",
	"laytan/cloak.nvim",
	"mfussenegger/nvim-dap",
	"sbdchd/neoformat",
	"nvim-treesitter/playground",
	"folke/which-key.nvim",
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {}
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim"
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		}
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 4,
			})
		end,
	},
	{
		"CosmicNvim/cosmic-ui",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("cosmic-ui").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons"
	},
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },          -- Required
			{ "hrsh7th/cmp-nvim-lsp" },      -- Required
			{ "hrsh7th/cmp-buffer" },        -- Required
			{ "hrsh7th/cmp-path" },          -- Required
			{ "hrsh7th/cmp-cmdline" },       -- Required
			{ "L3MON4D3/LuaSnip" },          -- Required
			{ "saadparwaiz1/cmp_luasnip" },  -- Required
			{ "rafamadriz/friendly-snippets" }, -- Required
			{ "onsails/lspkind-nvim" },      -- Required
		}
	}
}

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		plugins
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Plugins config
require("bufferline").setup({
	options = {
		mode = "tabs",
		themable = true,
		always_show_bufferline = false,
		indicator = {
			icon = "▎",
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})

require("telescope").setup()
require("nvim-autopairs").setup()
require("guess-indent").setup()
require("Comment").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-lightbulb").setup({ autocmd = { enabled = true } })

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"python",
		"tsx",
		"css",
		"json",
		"lua",
		"rust",
		"go",
		"vim",
	},
})

require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "➤" },
		topdelete = { text = "➤" },
		changedelete = { text = "▎" },
	},
})

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 25,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})

require("onedark").setup({
	style = "darker",
	transparent = "true",
	lualine = {
		transparent = true, -- lualine center bar transparency
	},
})

require("cloak").setup({
	enabled = true,
	cloak_character = "*",
	-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
	highlight_group = "Comment",
	-- Applies the length of the replacement characters for all matched
	-- patterns, defaults to the length of the matched pattern.
	cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
	patterns = {
		{
			-- Match any file starting with '.env'.
			-- This can be a table to match multiple file patterns.
			file_pattern = ".env*",
			-- Match an equals sign and any character after it.
			-- This can also be a table of patterns to cloak,
			-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
			cloak_pattern = "=.+",
		},
	},
})

require("onedark").load()
