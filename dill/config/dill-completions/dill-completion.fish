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
# Fish completion for dill

function __dill_packages
    pacman -Slq 2>/dev/null
end

function __dill_installed
    pacman -Qq 2>/dev/null
end

complete -c dill -f -n '__fish_is_first_arg' -a 'update install remove search -Syu -S -R -Q'

complete -c dill -f -n '__fish_seen_subcommand_from install -S' -a '(__dill_packages)'

complete -c dill -f -n '__fish_seen_subcommand_from remove -R' -a '(__dill_installed)'

complete -c dill -f -n '__fish_seen_subcommand_from search -Q' -a '(__dill_packages)'