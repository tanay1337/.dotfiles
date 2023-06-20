-- Set leader
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>ct", vim.cmd.CloakToggle)

-- Tabs
vim.keymap.set("n", "<leader>ta", ":tabnew<cr>")
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("n", "<leader>tn", ":tabn<cr>")
vim.keymap.set("n", "<leader>tp", ":tabp<cr>")
vim.keymap.set("n", "<leader>tmn", ":+tabmove<cr>")
vim.keymap.set("n", "<leader>tmp", ":-tabmove<cr>")

-- Telescope search
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>")

-- Treesitter playground toggle
vim.keymap.set("n", "<leader>pt", ":TSPlaygroundToggle<cr>")

-- Keep cursor in middle when jumping half pages with C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Format document
vim.keymap.set("n", "<leader>fd", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format document" })

-- Tmux Navigation
vim.keymap.set("n", "<C-h>", vim.cmd.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", vim.cmd.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTmuxNavigateRight)

-- Tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>:silent !tmux neww tmux-sessionizer<cr>")

-- chmod a current executable file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
