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

# ENV
export EDITOR='nvim'

# Aliases
alias vi="nvim"
alias vim="nvim"
alias b="bundle exec"
alias s="spring"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# Git aliases
alias gst="git status"
alias gco="git checkout"
alias gp="git push"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
