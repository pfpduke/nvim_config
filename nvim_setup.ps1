# nvim setup

$tools = @{
    "git"                = "git.git"
    "Neovim"             = "Neovim.Neovim"
    "ripgrep"            = "BurntSushi.ripgrep.GNU"
    "fd"                 = "sharkdp.fd"
    "Nerd Font"          = "DEVCOM.JetBrainsMonoNerdFont"
    "Lua"                = "DEVCOM.Lua"
    "Zig"                = "Zig.Zig"
    "Windows Terminal"   = "Microsoft.WindowsTerminal"
    "PowerShell"         = "Microsoft.PowerShell"
}

function IsInstalled($packageId) {
    $installed = winget list --id $packageId 2>$null
    return $installed -match $packageId
}

foreach ($tool in $tools.GetEnumerator()) {
    Write-Host "`nChecking: $($tool.Key)"
    if (IsInstalled $tool.Value) {
        Write-Host "$($tool.Key) is already installed"
    } else {
        Write-Host "$($tool.Key) not found. Installing..."
        winget install --id $tool.Value --accept-package-agreements --accept-source-agreements
    }
}

Write-Host "`nAll done!"
Write-Host "Set your terminal font to 'JetBrainsMonoNerdFont' for proper icon rendering."
