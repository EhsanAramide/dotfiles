local api = vim.api
local fn = vim.fn

local utils = require("utils")

-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer
--- false: if packer has been installed
local function packer_ensure_install()
  -- Where to install packer.nvim -- the package manager (we make it opt)
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto-install packer in case it hasn't been installed.
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})

  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")

packer.startup {

function(use)
  
  use {
    "lewis6991/impatient.nvim",
    config = [[require('impatient')]]
  }
  
  use { "wbthomason/packer.nvim", opt = true}
  
  use { "onsails/lspkind-nvim", event = "VimEnter" }

  -- auto-completion engine and its sources
  use {
    "hrsh7th/nvim-cmp",
    after = "lspkind-nvim",
    config = [[require('plugins.plugins_configs.nvim-cmp')]]
  } 
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
  use { 
    "quangnguyen30192/cmp-nvim-ultisnips",
    after = { "nvim-cmp", "ultisnips" } 
  }

  -- NVim LSP 
  use { 
    "neovim/nvim-lspconfig",
    after = "cmp-nvim-lsp",
    config = [[require('plugins.plugins_configs.lsp')]]
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config = [[require('plugins.plugins_configs.nvim-treesitter')]]
  }

  -- Shows match number and index in search
  use {
    "kevinhwang91/nvim-hlslens",
    branch = "main",
    keys = { 
      { "n", "*" },
      { "n", "#" }, 
      { "n", "n" },
      { "n", "N" }
    },
    config = [[require('plugins.plugins_configs.hlslens')]],
  }

  -- Searching utils
  use { 
     "Yggdroot/LeaderF",
     cmd = "Leaderf",
     run = ":LeaderfInstallCExtension"
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use { 
    "nvim-telescope/telescope-symbols.nvim", 
    after = "telescope.nvim" 
  }

  use { "morhetz/gruvbox" }
 
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = [[require('plugins.plugins_configs.lualine')]],
  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = [[require('plugins.plugins_configs.nvim-tree')]]
  }

  use { "nvim-tree/nvim-web-devicons" }

  use { "SirVer/ultisnips", event = "InsertEnter" }
  use { "honza/vim-snippets", after = "ultisnips" }

  use { "Raimondi/delimitMate", event = "InsertEnter" }

  use { "tpope/vim-commentary", event = "VimEnter" }

  use { "sbdchd/neoformat", cmd = { "Neoformat" } }

  use { 
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    config = [[require('plugins.plugins_configs.vim-fugitive')]]
  }

  use { 
    "lewis6991/gitsigns.nvim",
    after = "lualine.nvim",
    config = [[require('plugins.plugins_configs.gitsigns')]] 
  }


  use { 
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = [[require('plugins.plugins_configs.nvim-bqf')]]
  }

  use { "machakann/vim-sandwich", event = "VimEnter" }

  use { 
    "j-hui/fidget.nvim", 
    after = "nvim-lspconfig",
    config = [[require('plugins.plugins_configs.fidget-nvim')]]
  }

end,
config = {
  max_jobs = 16,
  compile_path = packer_util.join_paths(fn.stdpath("data"), "site", "lua", "packer_compiled.lua"),
},
}

-- For fresh install, we need to install plugins. Otherwise, we just need to require `packer_compiled.lua`.
if fresh_install then
  -- We run packer.sync() here, because only after packer.startup, can we know which plugins to install.
  -- So plugin installation should be done after the startup process.
  packer.sync()
else
  local status, _ = pcall(require, "packer_compiled")
  if not status then
    local msg = "File packer_compiled.lua not found: run PackerSync to fix!"
    vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
  end
end

-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/plugins/init.lua",
  group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "Nvim-config" })
  end,
})
