# Add homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
# Use Starship prompt
eval "$(starship init zsh)"
# Enable colors for 'ls'
export CLICOLOR=1
# Enable autosuggestions in zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Set default editor to emacs
export EDITOR="emacs -nw"
# Add aliases
alias rm="rm -i"
alias cls="clear;ls"
# Print fortune on startup
fortune
