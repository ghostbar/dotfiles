
# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/perl5/perlbrew/etc/bashrc
