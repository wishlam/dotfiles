export ZSH="$HOME/.oh-my-zsh"
export PS1='[%n@%m %~] %# '

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#################################
# Load legacy bash config (optional)
#################################

[[ -f ~/.bashrc ]] && source ~/.bashrc

########
#Aliases
#########

alias lock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
alias pp_json='python -mjson.tool'
alias burp='nohup java -XX:MaxPermSize=1G -jar /Applications/burpsuite_free_v1.6.32.jar & exit'
alias firefoxp='/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox-bin -ProfileManager'
alias repo='cd /Users/wlam/repositories/'
alias cat='bat --paging=never'
alias tf='terraform'

#########
# History
#########

HISTFILESIZE=5000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

##################################
# Zsh completion system (Homebrew)
##################################

if [[ -d $(brew --prefix)/share/zsh/site-functions ]]; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit
compinit

#######
# Tools
#######

# thefuck
eval "$(thefuck --alias)"

# tag-ag
#
# https://github.com/aykamko/tag/issues/48
#
# Make sure to build from source, clone repo: https://github.com/aykamko/tag
#
# $  go mod init github.com/aykamko/tag
# $ go mod tidy
# $ go build ./...
# $ sudo mv tag /usr/local/bin/
if (( $+commands[tag] )); then
  export TAG_SEARCH_PROG=rg  # replace with rg for ripgrep
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias rg=tag  # replace with rg for ripgrep
fi

# rbenv
eval "$(rbenv init - zsh)"

# pyenv
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
