# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git command-not-found extract github heroku history-substring-search npm redis-cli rsync vagrant zsh-syntax-highlighting)
plugin=(git command-not-found coffee extract git-extras git-flow github heroku history-substring-search npm redis-cli vagrant)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###############################################################################
# Customize to your needs...
#
# Powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#########
# Perlbrew
# source ~/perl5/perlbrew/etc/bashrc

#########
# Force rehash if nothing was auto-completed
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}

zstyle ':completion:*' completer \
  _oldlist _expand _force_rehash _complete ... 

#########
# Load aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

#########
# Load vars
if [ -e "$HOME/.shenv" ]; then
  source "$HOME/.shenv"
fi

#########
# Load profile
if [ -e "$HOME/.profile" ]; then
  source "$HOME/.profile"
fi

#########
# Load my functions
if [ -e "$HOME/.zsh/functions" ]; then
  for function in $HOME/.zsh/functions/*; do
    source $function
  done
fi

#########
# Enable autocompletion
#autoload -U compinit
#compinit
#setopt completealiases

#########
# Enable caching of autocomplete
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#########
# Disable autocorrect
unsetopt correct_all

## Loading PATH
export PATH="$HOME/bin:/usr/local/share/python:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
