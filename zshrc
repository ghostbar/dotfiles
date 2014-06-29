# Load Prezto if available:

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh";
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git command-not-found extract github heroku history-substring-search npm redis-cli rsync vagrant zsh-syntax-highlighting)
#plugin=(git command-not-found coffee extract git-extras git-flow github heroku history-substring-search npm redis-cli vagrant)

###############################################################################
# Customize to your needs...
#
# Powerline
if [[ -d /usr/local/lib/python2.7/site-packages/powerline ]]; then
  source "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh";
fi

#########
# Load aliases
if [[ -e "$HOME/.aliases" ]]; then
  source "$HOME/.aliases";
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
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache

#########
# Disable autocorrect
unsetopt correct_all
