bindkey -e

alias g="git"
alias neofetch="fastfetch"

if command -v eza > /dev/null; then
    alias l="eza"
    alias ls="eza"
    alias ll="eza -la"
else
    alias l="ls"
    alias ll="ls -la"
fi

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=brave

export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color

# golang
export PATH="$HOME/go/bin:$PATH"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# fly.io
export FLYCTL_INSTALL="/home/ross/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#     --color=bg+:#16181a,bg:#16181a \
#     --color=fg:#ffffff,header:#ffbd5e,info:#5ea1ff,pointer:#ff6e5e \
#     --color=marker:#f1ff5e,fg+:#ffffff,prompt:#f1ff5e,hl+:#ffbd5e"
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#     --color=bg+:#1e1f29,bg:#1e1f29 \
#     --color=fg:#f8f8f2,header:#bd93f9,info:#8be9fd,pointer:#ff5555 \
#     --color=marker:#f1fa8c,fg+:#f8f8f2,prompt:#f1ff5e,hl+:#bd93f9"

export PATH="$HOME/.atuin/bin:$PATH"

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^r' atuin-search
bindkey '^p' atuin-up-search

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%~%f ${vcs_info_msg_0_}%f$ '

# bun completions
[ -s "/home/ross/.bun/_bun" ] && source "/home/ross/.bun/_bun"

# function fuzzycd {
#     local target
#     target=$(find ~/ ~/personal ~/healthhero -mindepth 1 -maxdepth 1 -type d | fzf)
#     [[ -n "$target" ]] && cd "$target" && clear
# }
# alias z="fuzzycd"

export MANPAGER="nvim +Man!"

setopt auto_cd
setopt SHARE_HISTORY
setopt hist_expire_dups_first
setopt hist_ignore_dups

eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(zoxide init zsh)"

# dune
source $HOME/.local/share/dune/env/env.zsh
