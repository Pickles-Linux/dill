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
# Bash completion for dill


_dill() {
    local cur prev
    _get_comp_words_by_ref cur prev

    case $prev in
        -S|install)
            COMPREPLY=( $(compgen -W "$(pacman -Slq 2>/dev/null)" -- "$cur") )
            return 0
            ;;
        -R|remove)
            COMPREPLY=( $(compgen -W "$(pacman -Qq 2>/dev/null)" -- "$cur") )
            return 0
            ;;
        -Q|search)
            COMPREPLY=( $(compgen -W "$(pacman -Slq 2>/dev/null)" -- "$cur") )
            return 0
            ;;
        -Syu|update)
            # no completion
            return 0
            ;;
    esac

    if [[ $cur == -* ]]; then
        COMPREPLY=( $(compgen -W '-Syu -S -R -Q' -- "$cur") )
    else
        COMPREPLY=( $(compgen -W 'update install remove search' -- "$cur") )
    fi
}

complete -F _dill dill