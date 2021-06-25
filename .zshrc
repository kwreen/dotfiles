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
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# __/ Aliases
alias ls="ls -G"

# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# SHOPIFY

# __/ Dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
