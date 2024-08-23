if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(git node npm github zsh-syntax-highlighting zsh-autosuggestions git-open)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias ls="eza --icons"
alias pokemon="pokemon-colorscripts -r"
alias record="wl-screenrec"

bindkey -s ^f "tmux display-popup -E 'tmux-sessionizer'\n"
bindkey -s ^q "tmux display-popup -E 'tmux-cht.sh'\n"
bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
