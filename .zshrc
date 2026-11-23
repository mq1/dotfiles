# bootstrap tools
[[ -x "$HOME/.local/bin/mise" ]] || curl -fsSL https://mise.run | sh
[[ -d "$HOME/.antidote" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"

# enable powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# activate mise (package manager)
eval "$($HOME/.local/bin/mise activate zsh)"

# set up antidote (zsh plugin manager)
zstyle ':antidote:dynamic' zcompile 'yes'
zstyle ':antidote:bundle:*' zcompile 'yes'
source "$HOME/.antidote/antidote.zsh"
source <(antidote init)

# prompt
antidote bundle romkatv/powerlevel10k
antidote bundle romkatv/powerlevel10k path:config/p10k-lean-8colors.zsh

# completions
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
antidote bundle mattmc3/ez-compinit
antidote bundle zsh-users/zsh-completions kind:fpath path:src

# QOL
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle zdharma-continuum/fast-syntax-highlighting kind:defer
antidote bundle zdharma-continuum/history-search-multi-word

# enhanced history search
antidote bundle zsh-users/zsh-history-substring-search
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
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
