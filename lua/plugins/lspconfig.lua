return {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
  
      -- PowerShell
      lspconfig.powershell_es.setup({
        cmd = {
          "pwsh", "-NoLogo", "-NoProfile", "-Command",
          "& '" .. vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1" .. "'"
          .. " -BundledModulesPath '" .. vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services'"
          .. " -LogPath '$env:TEMP/powershell_es.log'"
          .. " -SessionDetailsPath '$env:TEMP/powershell_es.session.json'"
          .. " -FeatureFlags @()"
          .. " -AdditionalModules @()"
          .. " -HostName nvim"
          .. " -HostProfileId 0"
          .. " -HostVersion 1.0.0"
          .. " -Stdio"
          .. " -LogLevel Normal"
        },
        filetypes = { "ps1" },
      })
  
      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  }
  
