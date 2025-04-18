if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(git node npm github zsh-syntax-highlighting zsh-autosuggestions git-open)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias ls="eza --icons"
alias ps="pik"
alias top="btop"
alias cat="bat"
alias pokemon="pokemon-colorscripts -r"
alias record="wl-screenrec"
alias ff="fastfetch"

bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
