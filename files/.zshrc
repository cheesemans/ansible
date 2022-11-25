# Oh-my-zsh configuration

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions)

source ~/.oh-my-zsh/oh-my-zsh.sh

### User configuration ###

# Exports
export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
#alias ls='colorls -h --group-directories-first -1'
#alias l='colorls --group-directories-first --almost-all'
#alias ll='colorls --group-directories-first --almost-all --long'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Load extra config that I don't want in git
if [ -f $HOME/dotfiles/extra_files/.zshrc ]; then
    . $HOME/dotfiles/extra_files/.zshrc
fi

# Activate package suggestion when command is not found
source /etc/zsh_command_not_found

# HSTR configuration
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Load starship
eval "$(starship init zsh)"
