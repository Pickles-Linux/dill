##########################################################
#  Dill 
#  System update utility for Arch-based Linux distros
#
#  Repository:
#    https://github.com/Pickles-Linux/pickles-update 
#       To be moved to own Repor after 1st Stable Release
#
#  Author:
#    Stu Pickles
#    https://github.com/Stu-Pickles3047
#               for
#   Pickles Linux
#   https://github.com/Pickles-Linux/
#
#  License:
#    The Unlicense
#
# -------------------------------------------------
#  Description:
#    An update helper for Pickles Linux.
#    Designed for Humor, and future growth.
#   Designed as a complete AUR Helper, removing the need for Paru, yay or alternatives
#   dill is designed to be modular for easy update, ease of addition of extra scripts etc.
#   
#   Rated R for Raunchy Aussie 
#
#compdef dill

_dill() {
    local -a commands
    commands=(
        'update:update system'
        'install:install packages'
        '-S:install packages'
        'remove:remove packages'
        '-R:remove packages'
        'search:search packages'
        '-Q:search packages'
        '-Syu:update system'
    )

    _arguments -C \
        '1: :_describe command commands' \
        '*::package:->packages' \
        && return

    case $state in
        packages)
            case $words[2] in
                install|-S|search|-Q)
                    _values 'package' $(pacman -Slq 2>/dev/null)
                    ;;
                remove|-R)
                    _values 'package' $(pacman -Qq 2>/dev/null)
                    ;;
            esac
            ;;
    esac
}

_dill