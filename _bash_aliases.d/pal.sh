#complete -W '' palenv
complete -W 'local rh2 rh31 rh32 rc1' robot
complete -W 'rh2 rh2m rh32 rh32m rc2 rc2m' srobot

alias lazyCheckout='PAL_NO_CHECK_ENV=true $HOME/branches_svn/scm/bin/build/'\
'checkoutUtils/checkoutAndBuild-AllModules.sh '\
'$PAL_PROJECT_ROOT stacks robot local '\
'--branch=$PAL_BRANCH_NAME $*'

palenv() {
    case $1 in
        * )
            branch=dev
            ros=hydro
            ;;
    esac
    export WORKSPACE=$HOME
    PAL_USE_ROS=$ros . $HOME/branches_svn/scm/bin/pal_env/PAL_svn_env svn $HOME/$branch
    export CXX=$WORKSPACE/branches_svn/scm/bin/utils/developer_utils/g++
}

rbuser() {
    case $1 in
        rc2 | rc2m )
            rbuser=pal ;;
        * )
            rbuser=root ;;
    esac
    echo $rbuser
}

rbhost() {
    case $1 in
        local )
            rbhost=localhost ;;
        rh32m )
            rbhost=reemh3-2m ;;
        rh32 )
            rbhost=reemh3-2c ;;
        rc2 )
            rbhost=reemc-2c ;;
        rc2m )
            rbhost=reemc-2m;;
        rh2 )
            rbhost=rh2c ;;
        rh2m )
            rbhost=rh2m ;;
        * )
            rbhost=$1 ;;
    esac
    echo $rbhost
}

srobot() {
    ssh $(rbuser $1)@$(rbhost $1)
}

export GH_DEFAULT_USER="pal-robotics"

robot() {
    export ROS_MASTER_URI=http://$(rbhost $1):11311
}

alias r='cd $PAL_ROBOT_DIR'
alias s='cd $PAL_STACKS_DIR'
