# ------------------------------
# PATH
export PATH="/usr/local/bin:$PATH"

setopt autocd
# ------------------------------
# Enable Zsh completion
autoload -U compinit
compinit

# ------------------------------
# Aliases
alias ll="ls -l"
alias la="ls -la"
alias c="clear"
alias n="nvim"
alias ws="cd ${HOME}/workspace"
alias gs="git status"
alias update="echo 'Replace this with your update command'"

alias nvim-lazy='ln -sfn ~/dotfiles/nvim/lazy ~/.config/nvim'
alias nvim-chad='ln -sfn ~/dotfiles/nvim/nvchad ~/.config/nvim'

# ------------------------------
# Powerlevel10k
P10K_THEME="${HOME}/powerlevel10k/powerlevel10k.zsh-theme"
P10K_CONFIG="${HOME}/nix-config/home/dotfiles/.p10k.zsh"

[[ -f $P10K_THEME ]] && source $P10K_THEME
[[ -f $P10K_CONFIG ]] && source $P10K_CONFIG

# ------------------------------
# Zsh plugins
# ZSH_AUTOSUGGESTIONS="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# ZSH_SYNTAX_HIGHLIGHTING="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# [[ -f $ZSH_AUTOSUGGESTIONS ]] && source $ZSH_AUTOSUGGESTIONS
# [[ -f $ZSH_SYNTAX_HIGHLIGHTING ]] && source $ZSH_SYNTAX_HIGHLIGHTING

# Autosuggestions
if [ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# fallback nếu dùng git clone
elif [ -f ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (phải source cuối cùng)
if [ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fallback nếu dùng git clone
elif [ -f ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ------------------------------

eval "$(fnm env --use-on-cd --shell zsh)"

export PROMPT='%n@%m %1~ %# '

export PATH="$HOME/develop/flutter/bin:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)
