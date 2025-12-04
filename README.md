# Villanova CLI

# Requirements:

## Main requirement: BASH

the scripts are written in bash, however the activation/deactivation/auto-install scripts should be capable to run also in zsh

## Windows Users

You can obtain a bash version for windows by installing either:

- Git for windows
- Minimalistic GNU for Windows (MinGW)

_be sure the bash executable is in path_


## Other requirement

_run the environment dependencies checker_

```
ent check-env {mode}
```

# Installation

## On the fly:

**Quick Installation (recommended):**
```bash
# Method 1: Using hr/auto script with environment variable
curl -sL "https://raw.githubusercontent.com/Villanova-AI/villanova-cli/v0.9.0/hr/auto" | ENTANDO_RELEASE="v0.9.0" bash

# Method 2: Using auto-install directly (note the = signs!)
bash <(curl -L "https://raw.githubusercontent.com/Villanova-AI/villanova-cli/v0.9.0/auto-install") \
  --release="v0.9.0" --cli-version="v0.9.0"
```

**Important:** When using command-line parameters, use equals signs (e.g., `--release="v0.9.0"`), not spaces.

**Note:** The `{villanova-release-tag}` refers to release tags available at:
- https://github.com/Villanova-AI/villanova-releases/releases

Current stable version: **v0.9.0**


## Manual download:

_Clone the repository and run the installer:_
```bash
git clone https://github.com/Villanova-AI/villanova-cli.git
cd villanova-cli
git checkout v0.9.0
./auto-install --release="v0.9.0" --cli-version="v0.9.0"
```

# Help

```
ent help
```

or

```
ent {command} --help
```

# Activation

```
source <ent-path>/activate
```

_from bash or a zsh variant_

# Directory structure:

```
s/       => support scripts and bins
w/       => work/status dir (gitignored)
dist/    => distribution files
opt/     => additional dependencies and packages installed by ent
bin/     => the entando cli main script
bin/mod  => the implementations of the entando cli commands
```
