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
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"nmac427/guess-indent.nvim",
	"lewis6991/gitsigns.nvim",
	"mbbill/undotree",
	"sbdchd/neoformat",
	"folke/which-key.nvim",
	{ 'echasnovski/mini.indentscope', version = '*' },
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {}
	},
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim"
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
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
		"folke/snacks.nvim",
		opts = {
			dashboard = {},
			lazygit = {},
			terminal = {}
		}
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
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
	install = { colorscheme = { "tokyonight" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
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
require("guess-indent").setup {}
require("Comment").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
require('mini.indentscope').setup()

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
