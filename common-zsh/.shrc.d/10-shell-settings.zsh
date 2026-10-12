is_interactive_shell || return

setopt ignore_eof

## input history
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=8192
SAVEHIST=8192

HISTORY_IGNORE='ls'
setopt hist_ignore_space
setopt hist_ignore_dups

setopt append_history
setopt hist_verify      # don't immediately run history substitutions

# Shell options
setopt no_clobber
setopt notify

## line editing, like ~/.inputrc for bash
bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^[[A' history-beginning-search-backward    # up-arrow
bindkey '^[OA' history-beginning-search-backward    # up-arrow
bindkey '^[[B' history-beginning-search-forward     # down-arrow
bindkey '^[OB' history-beginning-search-forward     # down-arrow

## completion
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
