alias g="git"
alias ts="tmux-sessionizer"
alias vim="nvim"
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

export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --color=bg+:#1a1b26,bg:#1a1b26 \
    --color=fg:#a9b1d6,header:#ff9e64,info:#7da6ff,pointer:#ff7a93 \
    --color=marker:#ff7a93,fg+:#a9b1d6,prompt:#ff7a93,hl+:#ff9e64"

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^r' atuin-search
bindkey '^p' atuin-up-search

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%~%f ${vcs_info_msg_0_}%f$ '
