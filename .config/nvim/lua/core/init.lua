-- Global Variable Settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_perl_provider = 0  -- Disable perl provider
vim.g.loaded_ruby_provider = 0  -- Disable ruby provider
vim.g.loaded_node_provider = 0  -- Disable node provider
vim.g.did_install_default_menus = 1  -- do not load menu

vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Options Settings
vim.o.laststatus = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.autowrite = true
vim.o.autoread = true
vim.o.showcmd = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true

vim.o.updatetime = 500
vim.o.matchpairs = '(:),{:},[:],<:>'
vim.o.showmode = false
vim.o.spelllang = "en"
vim.o.virtualedit = "block"
vim.o.swapfile = false
vim.o.undofile = true
