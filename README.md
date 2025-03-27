# 🛠️ Nvim Setup for Windows

This script sets up a lightweight, developer-friendly Neovim environment.

## 📚 Interested in LazyVim?

Check out the official LazyVim documentation:
👉 [LazyVim Installation Guide](https://www.lazyvim.org/installation)


## 📦 What nvim_setup does

```powershell
irm https://raw.githubusercontent.com/pfpduke/nvim_config/main/nvim_setup.ps1 | iex
```

- [Neovim](https://neovim.io)
- Git
- PowerShell 7+
- Lua (DEVCOM.Lua)
- Zig (used by nvim-treesitter) needed to compile grammar parsers
- fd (for directory search in Telescope )
- ripgrep & fd (for fast search in Telescope)
- JetBrainsMonoNerdFont (for icons)
- Windows Terminal (optional but recommended)
- PowerShell (optional but recommended, gets latest version)

## 🚀 Setup Instructions

1. Backup any exsisting nvim config
2. Clone this repo.

```powershell
git clone git@github.com:pfpduke/nvim_config.git "$env:LOCALAPPDATA\nvim"
```
3. Open **PowerShell** as Administrator.
4. Run the setup script if you haven't already:

```powershell
.\nvim_setup.ps1
```
4. Add JetBrainsMonoNerdFont to windows terminal


