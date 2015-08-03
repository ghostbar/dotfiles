# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
fi

#Determine what OS is running in
if [ "$(uname)" == "Darwin" ]; then
  OS='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  OS='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  OS='cygwin'
fi

if [ "$OS" == "mac"]; then
  # set PATH so it includes /usr/local before the regular
  # this will help in MacOS X to use brew's installed version isntead of the
  # outdated on MacOS
  export PATH="/usr/local/bin:$PATH"

  # On Mac we use Postgres.app
  export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/9.4/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### This is a workaround so `nave` can work with Zsh.
export PATH="${NAVEPATH}:$PATH"
export PATH="$GOPATH/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

ulimit -n 8192
