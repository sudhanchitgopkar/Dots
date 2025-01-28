{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww30040\viewh18900\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# ==============================\
# Check Current Shell\
# ==============================\
current_shell=$(basename "$SHELL")\
echo "\uc0\u55356 \u57104  Current shell: $current_shell"\
\
# Change to zsh if not already using it\
if [ "$current_shell" != "zsh" ]; then\
    echo "\uc0\u55357 \u56960  Changing shell to zsh..."\
    chsh -s /bin/zsh\
else\
    echo "\uc0\u9989  You are already using zsh."\
fi\
\
# ==============================\
# Install Homebrew\
# ==============================\
echo -e "\\n\uc0\u55357 \u56589  Checking if Homebrew is installed..."\
if command -v brew &> /dev/null; then\
    echo "\uc0\u9989  Homebrew is already installed."\
else\
    echo "\uc0\u10060  Homebrew is not installed. Installing now..."\
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"\
fi\
\
# ==============================\
# Install Homebrew Formulae from Brewfile\
# ==============================\
brewfile_path="$PWD/homebrew/Brewfile"\
echo -e "\\n\uc0\u55357 \u56516  Installing Homebrew formulae from $brewfile_path..."\
if [ -f "$brewfile_path" ]; then\
    echo "\uc0\u55357 \u56580  Found Brewfile. Installing formulae..."\
    brew bundle --file="$brewfile_path"\
else\
    echo "\uc0\u10060  Brewfile not found at $brewfile_path."\
fi\
\
# ==============================\
# Symlink Emacs Files\
# ==============================\
echo -e "\\n\uc0\u55357 \u56599  Symlinking all files from $PWD/emacs/ to ~/.emacs.d/..."\
if [ -d "$PWD/emacs" ]; then\
    for file in "$PWD/emacs"/*; do\
        ln -sf "$file" "$HOME/.emacs.d/"\
    done\
    echo "\uc0\u9989  Emacs files have been successfully symlinked."\
else\
    echo "\uc0\u10060  $PWD/emacs/ directory not found."\
fi\
\
# ==============================\
# Install Emacs Packages\
# ==============================\
install_file="$PWD/emacs/install.el"\
echo -e "\\n\uc0\u55357 \u56540  Running $install_file to install Emacs packages..."\
if [ -f "$install_file" ]; then\
    emacs --batch -l "$install_file"\
    echo "\uc0\u9989  Emacs packages installed."\
else\
    echo "\uc0\u10060  $install_file not found."\
fi\
\
# ==============================\
# Symlink Starship Configuration\
# ==============================\
echo -e "\\n\uc0\u55357 \u56599  Creating symlink from $PWD/starship/starship.toml to ~/.config/starship.toml..."\
if [ -f "$PWD/starship/starship.toml" ]; then\
    ln -sf "$PWD/starship/starship.toml" "$HOME/.config/starship.toml"\
    echo "\uc0\u9989  Symlink created and existing symlink overridden."\
else\
    echo "\uc0\u10060  $PWD/starship/starship.toml not found."\
fi\
\
# ==============================\
# Symlink zshrc and Source it\
# ==============================\
echo -e "\\n\uc0\u55357 \u56599  Creating symlink from $PWD/zsh/zshrc to ~/.zshrc..."\
if [ -f "$PWD/zsh/zshrc" ]; then\
    ln -sf "$PWD/zsh/zshrc" "$HOME/.zshrc"\
    echo "\uc0\u9989  Symlink created for ~/.zshrc."\
    source "$HOME/.zshrc" &> /dev/null\
    echo "\uc0\u9989  Sourced ~/.zshrc."\
else\
    echo "\uc0\u10060  $PWD/zsh/zshrc not found."\
fi\
\
echo -e "\\n\uc0\u55356 \u57225  Setup complete!"\
}