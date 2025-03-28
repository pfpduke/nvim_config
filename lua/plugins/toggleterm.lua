return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      shell = "pwsh",
    })

    -- Optional: separate terminal if you ever want a dedicated one
    local Terminal = require("toggleterm.terminal").Terminal
    local ps_term = Terminal:new({
      cmd = "pwsh",
      direction = "horizontal",
      hidden = true,
    })

    vim.keymap.set("n", "<leader>ps", function()
      ps_term:toggle()
    end, { desc = "Toggle PowerShell (pwsh) Terminal" })
  end,
}


