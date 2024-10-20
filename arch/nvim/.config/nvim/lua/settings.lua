-- Show numbers and relative numbers on the left
vim.opt.number = true
vim.opt.relativenumber = true

-- Start moving the screen when the cursor is 8 lines away
vim.opt.scrolloff = 8

-- Tree style view for netrw
vim.cmd("let g:netrw_liststyle = 3")

-- How tabs behave
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- Format on save
vim.cmd([[autocmd BufWritePre * undojoin | Neoformat ]])
