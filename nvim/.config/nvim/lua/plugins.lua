-- Plugins

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-autopairs")
	use("mhartington/formatter.nvim")
	use("numToStr/Comment.nvim")
	use("nmac427/guess-indent.nvim")
	use("lewis6991/gitsigns.nvim")
	use("navarasu/onedark.nvim")
	use("mbbill/undotree")
	use("laytan/cloak.nvim")
	use("mfussenegger/nvim-dap")

	-- for some practive
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
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
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
