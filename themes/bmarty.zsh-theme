PROMPT='%{$fg[cyan]%}%m: %{$fg[yellow]%}$(get_pwd) $(git_prompt_info)%{$reset_color%} '
RPROMPT='$(virtualenv_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"

function get_pwd() {
    echo "${PWD/$HOME/~}"
}
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
function virtualenv_info {
        [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
