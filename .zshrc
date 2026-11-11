# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# GIT

# __/ Auto-completion
zstyle ':completion:*:*:git:*' script /usr/local/share/zsh/site-functions/git-completion.bash
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# __/ Prompt branch indicator
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' ('$branch')'
    fi
}


# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# STYLING

# __/ Prompt (Starship reads ~/.config/starship.toml)
export PATH="$HOME/.local/bin:$PATH"
(( $+commands[starship] )) && eval "$(starship init zsh)"


# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# COMMANDS

# __/ Aliases
alias ls="ls --color=auto"

# __/ Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
alias server-up="bundle install && ./bin/rails db:migrate"
alias server-attach="tmux attach-session -t server"
alias server-logs="tail -f log/development.log"
alias code-typecheck="bin/srb typecheck -a"
alias code-style="bin/style --include-branch-commits"
alias code-test="bin/test --include-branch-commits"
