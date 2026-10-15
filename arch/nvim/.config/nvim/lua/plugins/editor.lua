-- Editing behavior: indentation, comments, git signs, formatting
return {
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"nmac427/guess-indent.nvim",
	{ "lewis6991/gitsigns.nvim", opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "➤" },
			topdelete = { text = "➤" },
			changedelete = { text = "▎" },
		},
	} },
	"mbbill/undotree",
	"sbdchd/neoformat",
	{ "echasnovski/mini.indentscope", version = "*" },
	{ "kosayoda/nvim-lightbulb", opts = { autocmd = { enabled = true } } },
}
