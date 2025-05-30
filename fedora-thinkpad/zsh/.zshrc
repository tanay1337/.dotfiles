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
alias ff="fastfetch"
alias whatsapp="librewolf --new-window 'web.whatsapp.com'"
alias wa="whatsapp"
alias discord="librewolf --new-window 'discord.com/app'"

bindkey -s ^g "lazygit\n"

export EDITOR=nvim
export VISUAL="$EDITOR"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export PATH=~/.cargo/bin:${PATH}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
