#
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
#  Script Purpose:
#    PKGBUILD for the dill utility.
# -------------------------------------------------

# Maintainer: Stu Pickles <https://github.com/Stu-Pickles3047>
pkgname=dill
pkgver=0.0.2_alpha
pkgrel=1
pkgdesc="A raunchy Aussie AUR helper for Pickles Linux"
arch=('any')
url="https://github.com/Pickles-Linux/pickles-update"
license=('Unlicense')
depends=('bash' 'pacman' 'curl' 'git' 'jq' 'rate-mirrors')
provides=('dill')
conflicts=('dill-git')

# For local development builds, we skip the source array and use startdir
source=()
sha256sums=()

package() {
  # We reference the files relative to the PKGBUILD location using startdir
  local base_dir="${startdir}/dill"

  # 1. Main executable
  install -Dm755 "${base_dir}/dill" "${pkgdir}/usr/bin/dill"

  # 2. Helper scripts
  install -d "${pkgdir}/usr/lib/dill"
  install -m755 "${base_dir}/scripts/"* "${pkgdir}/usr/lib/dill/"

  # 3. Default configurations and language files
  install -d "${pkgdir}/usr/share/dill/config"
  install -m644 "${base_dir}/config/"dill.* "${pkgdir}/usr/share/dill/config/"

  # 4. Shell completions
  # Bash
  install -Dm644 "${base_dir}/config/dill-completions/dill-completion.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/dill"
  # Fish
  install -Dm644 "${base_dir}/config/dill-completions/dill-completion.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/dill.fish"
  # Zsh
  install -Dm644 "${base_dir}/config/dill-completions/dill-completion.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_dill"

  # 5. Man page
  if [ -f "${base_dir}/man/dill.1" ]; then
    install -Dm644 "${base_dir}/man/dill.1" "${pkgdir}/usr/share/man/man1/dill.1"
  fi

  # 6. Patching paths for system installation
  # Update the main 'dill' dispatcher to find scripts in /usr/lib/dill
  sed -i 's|SCRIPTS_DIR="$SCRIPT_DIR/scripts"|SCRIPTS_DIR="/usr/lib/dill"|' "${pkgdir}/usr/bin/dill"
  
  # Update dill-base to find config/language in /usr/share/dill/config
  sed -i 's|DILL_ROOT_DIR="$( cd "$DILL_SCRIPTS_DIR/.." \&> /dev/null \&\& pwd )"|DILL_ROOT_DIR="/usr/share/dill"|' "${pkgdir}/usr/lib/dill/dill-base"
  sed -i 's|DEFAULT_CONFIG_PATH="$DILL_ROOT_DIR/config/dill.config"|DEFAULT_CONFIG_PATH="/usr/share/dill/config/dill.config"|' "${pkgdir}/usr/lib/dill/dill-base"
  sed -i 's|source "$DILL_ROOT_DIR/config/dill.language"|source "/usr/share/dill/config/dill.language"|' "${pkgdir}/usr/lib/dill/dill-base"
}
