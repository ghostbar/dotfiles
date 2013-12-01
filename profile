
# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
fi

# set PATH so it includes /usr/local before the regular
# this will help in MacOS X to use brew's installed version isntead of the
# outdated on MacOS
export PATH="/usr/local/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### This is a workaround so `nave` can work with Zsh.
export PATH="${NAVEPATH}:$PATH"
