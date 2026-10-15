local opt = vim.opt

-- Show numbers and relative numbers on the left
opt.number = true
opt.relativenumber = true

-- Start moving the screen when the cursor is 8 lines away
opt.scrolloff = 8

-- Tree style view for netrw
vim.g.netrw_liststyle = 3

-- How tabs behave
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.mouse = "a"

-- Format on save, skipping buffers that can't be edited
local format_on_save = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_on_save,
	callback = function()
		if vim.bo.modifiable and vim.bo.filetype ~= "" then
			vim.cmd("silent! undojoin | Neoformat")
		end
	end,
})

-- Theme
vim.cmd([[colorscheme tokyonight-moon]])
