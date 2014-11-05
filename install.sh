#!/bin/sh

usage()
{
    cat << EOF
Usage: $0

Install/update symlinks to dotfiles
EOF
}
main()
{
    here=$(cd $(dirname $0) && pwd)

    if [ "$1" = "-h" ]; then
        usage
        exit 0
    fi

    if [ -d $here/.git ]; then
        echo Updating...
        git pull
    fi

    echo Fixing symlinks...
    for f in $(find $here/files -type f); do
        local path="$(dirname $f | sed 's,^'$here/files',\.,' | sed 's,/_,/\.,g')"
        local name="$(echo $(basename $f) | sed 's,^_,\.,')"
        local target=$HOME/$path/$name
        local target_path=$HOME/$path
        local display=$(echo $path/$name | sed 's,^\./,,')

        if [ ! -d $target_path ]; then
            echo " - '$target_path' does not exist, creating"
            mkdir -p $target_path
        fi

        if [ -h $target ]; then
            unlink $target
        elif [ -e $target ]; then
            echo " - '$display' already exists and is not a link, not doing anything"
            continue
        fi

        echo " - Creating link for '$display'..."
        ln -s $f $target
    done

    echo "Checking for scripts..."
    for f in $here/*.inst.sh; do
        echo " - Running script '$(basename $f)'..."
        sh $f
    done
}

main "$@"
