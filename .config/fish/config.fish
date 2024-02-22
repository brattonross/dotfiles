if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

function fish_prompt
    printf '%s' (prompt_pwd) (fish_git_prompt) ' $ '
end

alias g="git"
alias l="ls -la --color=auto"
alias ls="ls --color=auto"
alias ts="tmux-sessionizer"
alias vim="nvim"

export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color
