vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Move current line up and down
vim.keymap.set({"n", "x"}, "<A-k>", ':move -2<CR>', {desc = "move selection up"})
vim.keymap.set({"n", "x"}, "<A-j>", ':move +1<CR>', {desc = "move selection up"})

-- Navigation in the location and quickfix list
vim.keymap.set("n", "[l", "<CMD>lprevious<CR>zv", { silent = true, desc = "previous location item" })
vim.keymap.set("n", "]l", "<CMD>lnext<CR>zv", { silent = true, desc = "next location item" })
vim.keymap.set("n", "[L", "<CMD>lfirst<CR>zv", { silent = true, desc = "first location item" })
vim.keymap.set("n", "]L", "<CMD>llast<CR>zv", { silent = true, desc = "last location item" })
vim.keymap.set("n", "[q", "<CMD>cprevious<CR>zv", { silent = true, desc = "previous qf item" })
vim.keymap.set("n", "]q", "<CMD>cnext<CR>zv", { silent = true, desc = "next qf item" })
vim.keymap.set("n", "[Q", "<CMD>cfirst<CR>zv", { silent = true, desc = "first qf item" })
vim.keymap.set("n", "]Q", "<CMD>clast<CR>zv", { silent = true, desc = "last qf item" })
vim.keymap.set("n", [[\x]], "<CMD>windo lclose <bar> cclose <CR>", { silent = true, desc = "close qf and location list" })

vim.keymap.set("n", "<leader>wh", ":NvimTreeFindFileToggle<CR>", { silent = true, desc = "Open/Close nvim-tree find file"})

vim.keymap.set("n", "<leader>f", ":Neoformat<CR>", { silent = true, desc = "Format documents" })

