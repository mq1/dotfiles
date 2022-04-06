# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

zstyle ':omz:update' mode auto      # update automatically without asking

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# https://ohmyz.sh/
source $ZSH/oh-my-zsh.sh

PATH="$HOME/.local/bin:$PATH"

[[ -n $NAME ]] && SPACESHIP_CHAR_SYMBOL="[toolbox] $SPACESHIP_CHAR_SYMBOL"

alias config='/usr/bin/git --git-dir=/var/home/mq1/.cfg/ --work-tree=/var/home/mq1'

