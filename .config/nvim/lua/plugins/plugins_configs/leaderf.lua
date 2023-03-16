vim.g.Lf_UseCache = 0
vim.g.Lf_UseMemoryCache = 0
vim.g.Lf_DefaultMode = "FullPath"

local w =vim.fn.float2nr(vim.o.columns * 0.8)
if w > 140 then
  vim.g.Lf_PopupWidth = 140
else
  vim.g.Lf_PopupWidth = w
end

vim.g.Lf_PopupPosition = {0, vim.fn.float2nr((vim.o.columns - vim.g.Lf_PopupWidth)/2)}
vim.g.Lf_UseVersionControlTool = 0
vim.g.Lf_DefaultExternalTool = "rg"
vim.g.Lf_ShowHidden = 1
vim.g.Lf_ShortcutF = ""
vim.g.Lf_ShortcutB = ""
vim.g.Lf_WorkingDirectoryMode = "a"

-- Searchs files
vim.keymap.set("n", "<leader>ff", ":<C-U>Leaderf file --popup<CR>", { silent = true })

-- Greps project files
vim.keymap.set("n", "<leader>fg", ":<C-U>Leaderf rg --no-messages --popup<CR>", { silent = true })

-- Searchs vim help files
vim.keymap.set("n", "<leader>fh", ":<C-U>Leaderf help --popup<CR>", { silent = true })

-- Switchs buffers
vim.keymap.set("n", "<leader>fb", ":<C-U>Leaderf buffer --popup<CR>", { silent = true })

-- Searchs recent files
vim.keymap.set("n", "<leader>fr", ":<C-U>Leaderf mru --popup --absolute-path<CR>", { silent = true })

vim.g.Lf_PopupColorscheme = "gruvbox"
