-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>pv", ":Ex<cr>", { desc = "Open project view" })
keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Toggle undo tree" })
keymap.set("n", "<leader>ct", ":CloakToggle<cr>", { desc = "Toggle secrets cloak" })

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>nh", ":nohl<cr>", { desc = "Clear search highlights" })

-- Markdown preview
keymap.set("n", "<leader>mds", ":MarkdownPreview<cr>", { desc = "Start markdown preview" })
keymap.set("n", "<leader>mdc", ":MarkdownPreviewStop<cr>", { desc = "Close markdown preview" })

-- Increment and decrement numbers
keymap.set("n", "<leader>+" ,"<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-" ,"<C-x>", { desc = "Decrement number" })

-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<cr>", { desc = "Open LazyGit" })

-- Windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal" })
keymap.set("n", "<leader>sc", ":close<cr>", { desc = "Close the split window" })

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<cr>", { desc = "Open a new tab" })
keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "Close the current tab" })
keymap.set("n", "<leader>tn", ":tabn<cr>", { desc = "Open the next tab" })
keymap.set("n", "<leader>tp", ":tabp<cr>", { desc = "Open the previous tab" })
keymap.set("n", "<leader>tmn", ":+tabmove<cr>", { desc = "Move the current tab forward" })
keymap.set("n", "<leader>tmp", ":-tabmove<cr>", { desc = "Move the curent tab behind" })

-- Nvim tree
keymap.set("n", "<leader>nt", ":NvimTreeToggle<cr>", { desc = "Toggle nvim tree" })
keymap.set("n", "<leader>nf", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle nvim tree in current folder" })
keymap.set("n", "<leader>nc", ":NvimTreeCollapse<cr>", { desc = "Collapse items in nvim tree" })
keymap.set("n", "<leader>nr", ":NvimTreeRefresh<cr>", { desc = "Refresh nvim tree" })

-- Telescope search
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Search files" })
keymap.set("n", "<leader>gf", ":Telescope git_files<cr>", { desc = "Search files tracked by git" })
keymap.set("n", "<C-p>", ":Telescope git_files<cr>", { desc = "Search files tracked by git" })

-- Treesitter playground toggle
keymap.set("n", "<leader>pt", ":TSPlaygroundToggle<cr>", { desc = "Toggle Treesitter playground" })

-- Keep cursor in middle when jumping half pages with C-d and C-u
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Format document
keymap.set("n", "<leader>fd", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format document" })

-- chmod the current executable file
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Chmod the current executable file", silent = true })

-- Copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected text to system clipboard" })

-- Restore session
keymap.set("n", "<leader>rl", function() require("persistence").load({ last = true }) end, { desc = "Restore the last session" })
keymap.set("n", "<leader>rc", function() require("persistence").load() end, { desc = "Restore the last session for the current directory" })
