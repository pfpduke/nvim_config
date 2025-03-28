-- Set mapleader *before* loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Fix ps1 buffer issue
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.ps1",
    callback = function()
      if not vim.bo.modifiable then
        vim.bo.modifiable = true
        vim.cmd("edit") -- force reload so file is editable
      end
    end,
  })

-- Load custom keymaps
require("config.keymaps")

-- TODO Load custom options

-- load LazyVim and all plugins
require("config.lazy")

vim.cmd("colorscheme tokyonight")
