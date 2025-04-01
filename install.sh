#!/bin/bash
# ==============================
# Check Current Shell
# ==============================
current_shell=$(basename "$SHELL")
echo "🖥️ Current shell: $current_shell"

# Change to zsh if not already using it
if [ "$current_shell" != "zsh" ]; then
    echo "🔄 Changing shell to zsh... ⏳"
    if chsh -s /bin/zsh; then
        echo "✅ Shell changed to zsh. Please restart your terminal."
    else
        echo "❌ Failed to change shell to zsh. Please check your configuration."
    fi
else
    echo "🌟 You are already using zsh."
fi

# ==============================
# Install Homebrew
# ==============================
echo -e "\\n🍺 Checking if Homebrew is installed..."
if command -v brew &> /dev/null; then
    echo "✅ Homebrew is already installed."
else
    echo "⚠️ Homebrew is not installed. Installing now... 🚀"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ==============================
# Install Homebrew Formulae from Brewfile
# ==============================
brewfile_path="$PWD/homebrew/Brewfile"
echo -e "\\n📦 Installing Homebrew formulae from $brewfile_path..."
if [ -f "$brewfile_path" ]; then
    echo "🔥 Found Brewfile. Installing formulae..."
    brew bundle --file="$brewfile_path"
else
    echo "❌ Brewfile not found at $brewfile_path."
fi

# ==============================
# Symlink Emacs Files
# ==============================
echo -e "\\n🔗 Symlinking all files from $PWD/emacs/ to ~/.emacs.d/..."
if [ -d "$PWD/emacs" ]; then
    for file in "$PWD/emacs"/*; do
        ln -sf "$file" "$HOME/.emacs.d/"
    done
    echo "✅ Emacs files have been successfully symlinked."
else
    echo "❌ $PWD/emacs/ directory not found."
fi

# ==============================
# Install Emacs Packages
# ==============================
install_file="$PWD/emacs/install.el"
echo -e "\\n⚙️ Running $install_file to install Emacs packages..."
if [ -f "$install_file" ]; then
    emacs --batch -l "$install_file"
    echo "✅ Emacs packages installed."
else
    echo "❌ $install_file not found."
fi

# ==============================
# Symlink Starship Configuration
# ==============================
echo -e "\\n🚀 Creating symlink from $PWD/starship/starship.toml to ~/.config/starship.toml..."
if [ -f "$PWD/starship/starship.toml" ]; then
    ln -sf "$PWD/starship/starship.toml" "$HOME/.config/starship.toml"
    echo "✅ Symlink created and existing symlink overridden."
else
    echo "❌ $PWD/starship/starship.toml not found."
fi

# ==============================
# Symlink zshrc and Source it
# ==============================
echo -e "\\n🔗 Creating symlink from $PWD/zsh/zshrc to ~/.zshrc..."
if [ -f "$PWD/zsh/zshrc" ]; then
    ln -sf "$PWD/zsh/zshrc" "$HOME/.zshrc"
    echo "✅ Symlink created for ~/.zshrc."
    source "$HOME/.zshrc" &> /dev/null
    echo "✅ Sourced ~/.zshrc."
else
    echo "❌ $PWD/zsh/zshrc not found."
fi

echo -e "\\n🎉 Setup complete! 🚀"
