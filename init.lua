-- Set mapleader *before* loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load custom keymaps
require("config.keymaps")

-- TODO Load custom options

-- load LazyVim and all plugins
require("config.lazy")
