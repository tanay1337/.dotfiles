-- Editing behavior: indentation, comments, git signs, formatting
return {
	{ "windwp/nvim-autopairs", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{ "nmac427/guess-indent.nvim", opts = {} },
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
	{ "echasnovski/mini.indentscope", version = "*", opts = {} },
	{ "kosayoda/nvim-lightbulb", opts = { autocmd = { enabled = true } } },
}
