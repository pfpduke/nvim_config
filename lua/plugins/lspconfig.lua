return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    -- LSP capabilities from cmp (autocomplete)
    local has_cmp, cmp = pcall(require, "cmp_nvim_lsp")
    local capabilities = has_cmp and cmp.default_capabilities()
      or vim.lsp.protocol.make_client_capabilities()

    -- Full path to PowerShell executable
    local pwsh = "C:/Program Files/PowerShell/7/pwsh.exe"

    -- LSP startup script path
    local lsp_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
    local start_script = lsp_path .. "/PowerShellEditorServices/Start-EditorServices.ps1"

    -- Command to launch PowerShell Editor Services
    local powershell_cmd = {
      pwsh, "-NoLogo", "-NoProfile", "-Command",
      "& '" .. start_script .. "'" ..
      " -BundledModulesPath '" .. lsp_path .. "'" ..
      " -LogPath '$env:TEMP/powershell_es.log'" ..
      " -SessionDetailsPath '$env:TEMP/powershell_es.session.json'" ..
      " -FeatureFlags @()" ..
      " -AdditionalModules @()" ..
      " -HostName nvim" ..
      " -HostProfileId 0" ..
      " -HostVersion 1.0.0" ..
      " -Stdio" ..
      " -LogLevel Normal"
    }

    -- Setup PowerShell LSP
    lspconfig.powershell_es.setup({
      capabilities = capabilities,
      cmd = powershell_cmd,
      filetypes = { "ps1", "psm1", "psd1" },
      root_dir = util.find_git_ancestor or util.path.dirname,
    })

    -- Setup Lua LSP
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })
  end,
}


