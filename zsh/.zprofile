###########################################
# Homebrew (sets PATH and related env vars)
###########################################

eval "$(/opt/homebrew/bin/brew shellenv)"

#######################
# Environment variables
#######################

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Optional PATH additions (Zsh-native way)
path=(
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/local/sbin
  $HOME/.local/bin
  $path
)
