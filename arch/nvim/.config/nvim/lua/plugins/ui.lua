-- Theme, statusline, tabline, winbar, and key hints
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			-- Name of the LSP client attached to the current buffer
			local function lsp_name()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return "No Active LSP"
				end
				return clients[1].name
			end

			return {
				options = {
					theme = "tokyonight",
					component_separators = "",
					section_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "diagnostics" },
					lualine_c = {},
					lualine_x = { lsp_name, "diff", "branch" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			}
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				mode = "tabs",
				themable = true,
				always_show_bufferline = false,
				indicator = { icon = "▎", style = "icon" },
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	"folke/which-key.nvim",
}
