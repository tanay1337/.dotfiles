local keymap = vim.keymap

-- Project view (netrw)
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "Open project view" })

-- Undo tree
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo tree" })

-- Exit insert mode
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- LazyGit
keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Open LazyGit" })

-- Terminal
keymap.set("n", "<leader>tt", function() Snacks.terminal() end, { desc = "Toggle terminal" })

-- Windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close the split window" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Open the next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Open the previous tab" })
keymap.set("n", "<leader>tmn", "<cmd>+tabmove<CR>", { desc = "Move the current tab forward" })
keymap.set("n", "<leader>tmp", "<cmd>-tabmove<CR>", { desc = "Move the current tab behind" })

-- Nvim tree
keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })
keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle nvim tree in current folder" })
keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse items in nvim tree" })
keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh nvim tree" })

-- Telescope search
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find word" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find files tracked by git" })

-- Keep cursor in middle when jumping half pages
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half a page down, centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half a page up, centered" })

-- Format document
keymap.set("n", "<leader>fd", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format document" })

-- Make the current file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Chmod the current executable file", silent = true })

-- Copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected text to system clipboard" })

-- Restore session
keymap.set("n", "<leader>rl", function() require("persistence").load({ last = true }) end, { desc = "Restore the last session" })
keymap.set("n", "<leader>rc", function() require("persistence").load() end, { desc = "Restore the last session for the current directory" })
keymap.set("n", "<leader>rs", function() require("persistence").select() end, { desc = "Select a session to restore" })
