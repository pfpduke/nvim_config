return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = false }, -- Prevent LSP issues
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["<CR>"] = function(state)
              local node = state.tree:get_node()
              if node.type == "file" then
                require("neo-tree.sources.filesystem.commands").open(state)
              elseif node.type == "directory" then
                require("neo-tree.sources.filesystem.commands").toggle_node(state)
              end
            end,
            ["l"] = "open",
            ["u"] = function(state)
              local parent = vim.fn.fnamemodify(state.path, ":h")
              require("neo-tree.sources.filesystem").navigate(state, parent)
            end,
            ["R"] = "refresh", -- Restore Refresh keybinding
          },
        },
      },
    })
  end,
}


