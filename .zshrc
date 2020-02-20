# Antibody
if [ -f "$HOME/.zsh_plugins.sh" ]; then
  source ~/.zsh_plugins.sh
else
  echo "Installing antibody plugins..."
  antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh
  source $HOME/.zsh_plugins.sh
fi

# Load autocomplete & prompt
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# PATH changes
export PATH="/usr/local/sbin:$PATH"
