# 🛠️ Stephen's Dotfiles

Welcome to my personal dotfiles. This is a highly customized, keyboard-centric macOS setup using modern terminal tooling and a tiling-first philosophy. It’s built to be fast, minimalist, and distraction-free.

---

## 🧰 Toolchain Overview

| Tool         | Purpose                                       |
|--------------|-----------------------------------------------|
| [Neovim](https://neovim.io)     | Editor (LazyVim with custom plugins and LSPs) |
| [Zellij](https://zellij.dev)    | Terminal multiplexer with workspace support   |
| [Ghostty](https://ghostty.app)  | GPU-accelerated terminal emulator              |
| [Sketchybar](https://felixkratz.github.io/SketchyBar) | Custom macOS status bar                    |
| [Aerospace](https://aerospace.dev) | macOS tiling window manager replacement       |
| [`zsh`](https://www.zsh.org) + [`starship`](https://starship.rs) | Shell and prompt |

Additional tools: `lazygit`, `ripgrep`, `fd`, `fzf`, `eza`, `uv`, `yazi`, `node`, and more — all installed via Homebrew.

---

## 🚀 Installation Guide

This setup script is for fresh macOS installs. It installs all required CLI/GUI software and symlinks config files via [GNU Stow](https://www.gnu.org/software/stow/).

### ✅ Requirements

- macOS (Intel or Apple Silicon)
- [Xcode Command Line Tools](https://developer.apple.com/xcode/)
- Internet access
- Git installed

---

### 📦 Installation Steps

1. **Clone the repo**

```bash
git clone https://github.com/Stephen-init/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

This script will:

Install or update Homebrew
Tap required repositories
Install CLI tools, fonts, and GUI apps
Stow dotfiles into ~/.config/<toolname>/ (e.g. ~/.config/nvim)

### Note 
Remember to copy zshrc_template to your .zshrc
