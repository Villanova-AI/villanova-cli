#!/bin/bash
#
# Villanova CLI One-Liner Installation Script
#
# This script can be hosted at get.villanova.ai or similar URL
#
# Usage:
#   curl -sL "https://get.villanova.ai" | ENTANDO_RELEASE="v0.9.0" bash
#   or
#   bash <(curl -sL "https://get.villanova.ai") --release="v0.9.0"
#

if ( [[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ ]] ||
     [[ -n $KSH_VERSION && $(cd "$(dirname -- "$0")" &&
     printf '%s' "${PWD%/}/")$(basename -- "$0") != "${.sh.file}" ]] ||
     [[ -n $BASH_VERSION ]] && (return 0 2>/dev/null) ); then
  # SCRIPT WAS SOURCED
  source /dev/stdin <<<"$(curl -L https://raw.githubusercontent.com/Villanova-AI/villanova-cli/v0.9.0/hr/auto)" "$@"
else
  # SCRIPT WAS NOT SOURCED
  bash <(curl -L https://raw.githubusercontent.com/Villanova-AI/villanova-cli/v0.9.0/hr/auto) "$@"
fi