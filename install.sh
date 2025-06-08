#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Script Start ---
echo "--- Comprehensive Dotfiles Setup and Software Installation Script ---"
echo "Starting installation process..."

# 1. Install Homebrew (if not already installed)
echo -e "\n--- Installing Homebrew (if not already installed) ---"
if ! command_exists brew; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "Error: Homebrew installation failed. Aborting."
    exit 1
  }

  # Set up Homebrew PATH for the current script session
  # This is crucial so subsequent 'brew' commands work immediately.
  if [ -d "/opt/homebrew" ]; then # For Apple Silicon Macs
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d "/usr/local/homebrew" ]; then # For Intel Macs
    eval "$(/usr/local/homebrew/bin/brew shellenv)"
  else
    # Fallback/generic path setup. `brew shellenv` should find itself if just installed.
    eval "$(brew shellenv)" || {
      echo "Error: Failed to set Homebrew environment variables. Please check your Homebrew installation. Aborting."
      exit 1
    }
  fi
  echo "Homebrew installed and paths set for current session."
else
  echo "Homebrew is already installed. Updating and upgrading existing packages..."
  brew update || { echo "Warning: Homebrew update failed. Continuing anyway."; }
  brew upgrade || { echo "Warning: Homebrew upgrade failed. Continuing anyway."; }
fi

# 2. Tap custom Homebrew repositories (must be done before installing packages from them)
echo -e "\n--- Tapping custom Homebrew repositories ---"
# Check if tap is already installed before trying to tap
if ! brew tap | grep -q "felixkratz/formulae"; then
  brew tap FelixKratz/formulae || {
    echo "Error: Failed to tap FelixKratz/formulae. Aborting."
    exit 1
  }
  echo "Tapped FelixKratz/formulae."
else
  echo "FelixKratz/formulae already tapped. Skipping."
fi

# 3. Install Homebrew Formulae (CLI tools)
echo -e "\n--- Installing Homebrew Formulae (CLI tools) ---"
# Each 'brew install' command is explicitly listed.
# '|| echo "Warning: ..."' makes the script continue even if one package fails to install.

echo "Installing ghostty..."
brew install ghostty || echo "Warning: Failed to install ghostty. Continuing with others."

echo "Installing neovim..."
brew install neovim || echo "Warning: Failed to install neovim. Continuing with others."

echo "Installing uv..."
brew install uv || echo "Warning: Failed to install uv. Continuing with others."

echo "Installing yazi..."
brew install yazi || echo "Warning: Failed to install yazi. Continuing with others."

echo "Installing eza..."
brew install eza || echo "Warning: Failed to install eza. Continuing with others."

echo "Installing stow..."
brew install stow || echo "Warning: Failed to install stow. Continuing with others."

echo "Installing zellij..."
brew install zellij || echo "Warning: Failed to install zellij. Continuing with others."

echo "Installing ripgrep..."
brew install ripgrep || echo "Warning: Failed to install ripgrep. Continuing with others."

echo "Installing fd..."
brew install fd || echo "Warning: Failed to install fd. Continuing with others."

echo "Installing zoxide..."
brew install zoxide || echo "Warning: Failed to install zoxide. Continuing with others."

echo "Installing khal..."
brew install khal || echo "Warning: Failed to install khal. Continuing with others."

echo "Installing lazygit..."
brew install lazygit || echo "Warning: Failed to install lazygit. Continuing with others."

echo "Installing node (includes npm)..."
brew install node || echo "Warning: Failed to install node. Continuing with others."

echo "Installing lazydocker..."
brew install lazydocker || echo "Warning: Failed to install lazydocker. Continuing with others."

echo "Installing bat..."
brew install bat || echo "Warning: Failed to install bat. Continuing with others."

echo "Installing fzf..."
brew install fzf || echo "Warning: Failed to install fzf. Continuing with others."

echo "Installing starship..."
brew install starship || echo "Warning: Failed to install starship. Continuing with others."

echo "Installing git..."
brew install git || echo "Warning: Failed to install git. Continuing with others."

echo "Installing aerospace..."
brew install aerospace || echo "Warning: Failed to install aerospace. Continuing with others."

echo "Installing border (from FelixKratz/formulae)..."
brew install border || echo "Warning: Failed to install border. Continuing with others."

echo "Installing sketchybar (from FelixKratz/formulae)..."
brew install sketchybar || echo "Warning: Failed to install sketchybar. Continuing with others."

# 4. Install Homebrew Casks (GUI applications/fonts)
echo -e "\n--- Installing Homebrew Casks (GUI apps and fonts) ---"

echo "Installing JetBrains Mono Nerd Font..."
brew install --cask font-jetbrains-mono-nerd-font || echo "Warning: Failed to install font-jetbrains-mono-nerd-font. Continuing with others."

echo "Installing Orbstack..."
brew install --cask orbstack || echo "Warning: Failed to install orbstack. Continuing with others."

# --- install oh my zsh
echo -e "\n--- Installing Oh My Zsh ---"
if [ ! -d "<span class="math-inline">HOME/\.oh\-my\-zsh" \]; then
\# Use non\-interactive install \(RUNZSH\=no\) to prevent it from auto\-starting zsh
\# and messing with the script flow\.
RUNZSH\=no <8\>sh \-c "</span>(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))" || { echo "Error: Failed to install Oh My Zsh. Aborting."; exit 1; }
  echo "Oh My Zsh installed."
else
  echo "Oh My Zsh is already installed. Skipping."
fi

# install oh my zsh plugin 
echo -e "\n--- Installing Oh My Zsh Plugins ---"

# zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-<span class="math-inline">HOME/\.oh\-my\-zsh/custom\}/plugins/zsh\-autosuggestions" \]; then</9\>
git clone \[https\://github\.com/zsh\-users/zsh\-autosuggestions\]\(https\://github\.com/zsh\-users/zsh\-autosuggestions\)</10\> "</span>{ZSH_CUSTOM:-<span class="math-inline">HOME/\.oh\-my\-zsh/custom\}/plugins/zsh\-autosuggestions" \|\| \{ echo "Error\: Failed to clone zsh\-autosuggestions\. Aborting\."; exit 1; \}
echo "zsh\-autosuggestions installed\."
else
echo "zsh\-autosuggestions already installed\. Skipping\."
fi
\# zsh\-syntax\-highlighting
echo "Installing zsh\-syntax\-highlighting\.\.\."
<11\>if \[ \! \-d "</span>{ZSH_CUSTOM:-<span class="math-inline">HOME/\.oh\-my\-zsh/custom\}/plugins/zsh\-syntax\-highlighting" \]; then
git clone \[https\://github\.com/zsh\-users/zsh\-syntax\-highlighting\.git\]\(<12\>https\://github\.com/zsh\-users/zsh\-syntax\-highlighting\.git\)</11\> "</span>{ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" || { echo "Error: Failed to clone zsh-syntax-highlighting. Aborting."; exit 1; }
  echo "zsh-syntax-highlighting installed."
else
  echo "zsh-syntax-highlighting already installed. Skipping."
fi

echo "Remember to enable these plugins in your .zshrc file (e.g., plugins=(git zsh-autosuggestions zsh-syntax-highlighting))."

# --- Configuration ---
# Assumes the script is run from the root of your dotfiles Git repository.
DOTFILES_REPO_PATH="$(pwd)"
CONFIG_DIR_BASE="$HOME/.config"

# --- Helper Function ---
# Checks if a given command exists in the system's PATH.
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# --- Script Start ---
echo "--- Dotfiles Setup Script (Bash) ---"
echo "Assuming dotfiles repository is at: $DOTFILES_REPO_PATH"
echo "Target base config directory: $CONFIG_DIR_BASE"

# 1. Check if GNU Stow is installed
echo -e "\n--- Checking for GNU Stow ---"
if ! command_exists stow; then
  echo "Error: GNU Stow is not installed. Please install it (e.g., 'sudo apt install stow' on Debian/Ubuntu, 'brew install stow' on macOS) and try again."
  exit 1
fi
echo "GNU Stow found."

# 2. Ensure the base ~/.config directory exists
echo -e "\n--- Ensuring base directory '$CONFIG_DIR_BASE' exists ---"
mkdir -p "$CONFIG_DIR_BASE"
echo "Directory '$CONFIG_DIR_BASE' is ready."

# 3. Identify dotfile packages (top-level subdirectories in your repo)
echo -e "\n--- Identifying dotfile packages in repository ---"
PACKAGES=()
for item in "$DOTFILES_REPO_PATH"/*; do
  # Check if it's a directory and not a hidden directory (like .git, .vscode, etc.)
  if [ -d "$item" ] && [[ "$(basename "$item")" != .* ]]; then
    PACKAGES+=("$(basename "$item")")
  fi
done

if [ ${#PACKAGES[@]} -eq 0 ]; then
  echo "No valid dotfile packages (non-hidden subdirectories) found in the repository to stow. Exiting."
  exit 0
fi

echo "Found packages: ${PACKAGES[*]}"

# 4. Unstow any previously linked packages to ensure a clean state
#    This is crucial to remove any links that might have been created incorrectly in previous attempts.
echo -e "\n--- Unstowing all packages (cleaning up any previous links) ---"
for package in "${PACKAGES[@]}"; do
  echo "Attempting to unstow '$package'..."
  # We use `|| true` so that the script doesn't exit if stow -D fails
  # (e.g., if a link doesn't exist, stow -D would typically error).
  # We pass -t $CONFIG_DIR_BASE because that's where previous (potentially incorrect)
  # links would have been created (e.g., ~/.config/init.lua).
  stow -D -t "$CONFIG_DIR_BASE" "$package" || true
done
echo "Previous links cleared (if any)."

# 5. Create target subdirectories in ~/.config and then stow each package correctly
echo -e "\n--- Stowing packages into their dedicated directories ---"
for package in "${PACKAGES[@]}"; do
  TARGET_PACKAGE_DIR="$CONFIG_DIR_BASE/$package"
  echo -e "\nProcessing package: '$package'"

  # Create the specific target directory for the package within ~/.config
  # E.g., for 'nvim' package, this creates '~/.config/nvim'
  echo "Ensuring target directory '$TARGET_PACKAGE_DIR' exists..."
  mkdir -p "$TARGET_PACKAGE_DIR"

  # Stow the package's contents into its dedicated target directory
  # E.g., 'stow -t ~/.config/nvim nvim' will link contents of 'dotfiles/nvim' into '~/.config/nvim'
  echo "Stowing '$package' to '$TARGET_PACKAGE_DIR'..."
  stow -t "$TARGET_PACKAGE_DIR" "$package"
  echo "Successfully stowed '$package'."
done

echo -e "\n--- Dotfiles Setup Complete! ---"
echo "Your configuration files are now linked under '$CONFIG_DIR_BASE/<package_name>/'."
echo "Please verify your applications are picking up the configs correctly."
