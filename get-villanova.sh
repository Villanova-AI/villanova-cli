#!/bin/bash
#
# Villanova CLI One-Liner Installation Script
#
# This script can be hosted at get.villanova.ai or similar URL
#
# Usage:
#   curl -sL "https://get.villanova.ai" | VILLANOVA_RELEASE="v0.9.0" bash
#   or
#   bash <(curl -sL "https://get.villanova.ai") --release="v0.9.0"
#

# Determine the version to use
# Priority: 1. --release argument, 2. VILLANOVA_RELEASE env var, 3. default
VILLANOVA_CLI_BRANCH="${VILLANOVA_RELEASE:-v0.9.0}"

# Parse the --release argument (overrides environment variable)
for arg in "$@"; do
  if [[ "$arg" == --release=* ]]; then
    VILLANOVA_CLI_BRANCH="${arg#*=}"
    VILLANOVA_CLI_BRANCH="${VILLANOVA_CLI_BRANCH//\"/}"  # Remove quotes
  fi
done

if ( [[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ ]] ||
     [[ -n $KSH_VERSION && $(cd "$(dirname -- "$0")" &&
     printf '%s' "${PWD%/}/")$(basename -- "$0") != "${.sh.file}" ]] ||
     [[ -n $BASH_VERSION ]] && (return 0 2>/dev/null) ); then
  # SCRIPT WAS SOURCED
  export VILLANOVA_RELEASE="$VILLANOVA_CLI_BRANCH"
  source /dev/stdin <<<"$(curl -L https://raw.githubusercontent.com/Villanova-AI/villanova-cli/$VILLANOVA_CLI_BRANCH/hr/auto)"
else
  # SCRIPT WAS NOT SOURCED
  export VILLANOVA_RELEASE="$VILLANOVA_CLI_BRANCH"
  bash <(curl -L https://raw.githubusercontent.com/Villanova-AI/villanova-cli/$VILLANOVA_CLI_BRANCH/hr/auto)
fi