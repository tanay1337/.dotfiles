-- Show numbers and relative numbers on the left
vim.opt.number = true
vim.wo.relativenumber = true

-- Start moving the screen when the cursor is 8 lines away
vim.opt.scrolloff = 8

-- How tabs behave
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- Disable Copilot by default
vim.g.copilot_enabled = false

-- Vimwiki settings
vim.g.vimwiki_list = { { path = "~/vimwiki", syntax = "markdown", ext = ".md" } }

-- Format on save
vim.cmd([[autocmd BufWritePre * undojoin | Neoformat ]])
