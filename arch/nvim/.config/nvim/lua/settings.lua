local opt = vim.opt

-- Show numbers and relative numbers on the left
opt.number = true
opt.relativenumber = true

-- Start moving the screen when the cursor is 8 lines away
opt.scrolloff = 8

-- Tree style view for netrw
vim.cmd("let g:netrw_liststyle = 3")

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

-- Format on save
vim.cmd([[autocmd BufWritePre * undojoin | Neoformat ]])

-- Theme
vim.cmd[[colorscheme tokyonight-night]]
