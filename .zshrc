# Git completion
zstyle ':completion:*:*:git:*' script /usr/local/share/zsh/site-functions/git-completion.bash
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# Git branch indicator
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' ('$branch')'
    fi
}

# Prompt
setopt prompt_subst
PROMPT="%F{cyan}%n%F{white}@%F{green}%m %F{yellow}%~%F{207}\$(git_branch) %f%b$ "

# Aliases
alias ls="ls -G"

# Shopify dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
