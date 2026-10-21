export ZSH="$HOME/.oh-my-zsh"

plugins=(git node npm zsh-syntax-highlighting zsh-autosuggestions git-open)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias ls="eza --icons"
alias ps="pik"
alias hist="history -1 1 | fzf | awk '{for(i=2; i<NF; i++) {printf(\"%s \", \$i)} print \$NF}' | wtype -"
alias top="btop"
alias cat="bat"
alias ff="fastfetch"

bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

eval "$(zoxide init zsh)"

export PATH="$PATH:/home/tanay/.local/bin"

eval "$(starship init zsh)"
