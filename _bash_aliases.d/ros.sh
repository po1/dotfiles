complete -W 'hydro fuerte' rosenv

rosenv() {
    case $1 in
        * )
            setuppath=/opt/ros/$1/setup.bash
            ;;
    esac
    . $setuppath
}
