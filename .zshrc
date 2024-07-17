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

# __/ Prompt
setopt prompt_subst
PROMPT="%F{cyan}%n%F{white}@%F{green}%m %F{yellow}%~%F{207}\$(git_branch) %f%b$ "

# __/ Powerlevel10k
# POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# source ~/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# COMMANDS

# __/ Aliases
alias ls="ls -G"

# __/ Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
alias server-up="bundle install && ./bin/rails db:migrate"
alias server-start=".spin/bin/server"
alias server-attach="tmux attach-session -t server"
alias server-logs="tail -f log/development.log"
alias code-typecheck="bin/srb typecheck -a"
alias code-style="bin/style --include-branch-commits"
alias code-test="bin/test --include-branch-commits"
