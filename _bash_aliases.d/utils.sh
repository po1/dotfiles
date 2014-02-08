gh()
{
    local user
    if [ -z "$GH_DEFAULT_USER"]; then
        user=po1
    fi
    if [ $# -gt 1 ]; then
        user=$1
        shift
    fi
    git clone https://github.com/$user/$1
}

_g_complete()
{
    if [ "$COMP_CWORD" = "1" ]; then
        local cur=${COMP_WORDS[COMP_CWORD]}
        local opts=$(cd $HOME/github && find . -mindepth 1 \
            -maxdepth 1 -type d | sed 's,^\./,,')
        COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
    fi
}
function g
{
    cd $HOME/github/$1
}
complete -F _g_complete g

function gct()
{
    if [ -z "$path" ]; then local path=$(pwd)
    else local path=$(cd $1 && pwd); fi
    if [ -d $path/.git ]; then
        ( cd $path && ctags -R --c++-kinds=+p --exclude='.git' --fields=+iaS \
            --extra=+q -f .git/tags )
    else
        if [ $path != $(dirname $path) ]; then
            gct $(dirname $path)
        fi
    fi
}
