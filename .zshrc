bindkey -e

alias g="git"

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

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

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

export MANPAGER="nvim +Man!"

setopt auto_cd
setopt SHARE_HISTORY
setopt hist_expire_dups_first
setopt hist_ignore_dups

eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(zoxide init zsh)"
