-- Plugins

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("nmac427/guess-indent.nvim")
	use("lewis6991/gitsigns.nvim")
	use("navarasu/onedark.nvim")
	use("mbbill/undotree")
	use("laytan/cloak.nvim")
	use("mfussenegger/nvim-dap")
	use("sbdchd/neoformat")
	use("nvim-treesitter/playground")

	use("vimwiki/vimwiki")

	use("github/copilot.vim")

	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	use({
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 4,
			})
		end,
	})

	use({
		"CosmicNvim/cosmic-ui",
		requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("cosmic-ui").setup()
		end,
	})

	-- for some practice
	use("ThePrimeagen/vim-be-good")

	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use({
		"alvarosevilla95/luatab.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
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
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Required
			{ "hrsh7th/cmp-path" }, -- Required
			{ "hrsh7th/cmp-cmdline" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Required
			{ "onsails/lspkind-nvim" }, -- Required
		},
	})
end)

require("luatab").setup()
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
		"prisma",
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
