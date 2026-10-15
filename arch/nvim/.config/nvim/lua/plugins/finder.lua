-- Finding files, browsing, terminal, and sessions
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sort_by = "case_sensitive",
			view = { width = 25 },
			renderer = { group_empty = true },
			filters = { dotfiles = false },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {},
			lazygit = {},
			terminal = {},
		},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- only start saving sessions once a file is opened
		opts = {},
	},
}
