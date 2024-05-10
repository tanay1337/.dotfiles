if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git node npm github zsh-syntax-highlighting zsh-autosuggestions git-open)

source $ZSH/oh-my-zsh.sh

alias python="python3"
alias pip="pip3"
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias ls="colorls"
alias cat="bat"
alias play="tmux display-popup -E 'play'"

bindkey -s ^f "tmux display-popup -E 'tmux-sessionizer'\n"
bindkey -s ^q "tmux display-popup -E 'tmux-cht.sh'\n"
bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/opt/homebrew/bin:$PATH"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
