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
alias hist="history -1 1 | fzf | awk '{for(i=2; i<NF; i++) {printf(\"%s \", \$i)} print \$NF}' | wtype -"
alias top="btop"
alias cat="bat"
alias pokemon="pokemon-colorscripts -r"
alias ff="fastfetch"
alias matrix="unimatrix"

bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Created by `pipx` on 2025-06-15 09:05:32
export PATH="$PATH:/home/tanay/.dotfiles/arch/bin/.local/bin"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Created by `pipx` on 2025-10-10 07:00:40
export PATH="$PATH:/home/tanay/.dotfiles/arch-thinkpad/bin/.local/bin"
export PATH="$PATH:/home/tanay/.local/bin"
