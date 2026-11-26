# bootstrap antidote
if [[ ! -d "$HOME/.antidote" ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

# enable powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# activate mise (package manager)
if [[ -x "$HOME/.local/bin/mise" ]]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

# set up antidote (zsh plugin manager) and plugins
source "$HOME/.antidote/antidote.zsh"
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
antidote load

# for zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

# aliases
alias ls="ls --color=auto"
alias v="nvim"
alias dotfiles="git --git-dir='$HOME/.dotfiles/' --work-tree='$HOME'"
alias ctx="tail -v -n +1"
