# vim: ft=zsh

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path;

#Determine what OS is running in
if [ "$(uname)" = "Darwin" ]; then
  OS='mac'
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  OS='linux'
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  OS='cygwin'
fi

if [ "$OS" = "mac" ]; then
  # set PATH so it includes /usr/local before the regular
  # this will help in MacOS X to use brew's installed version isntead of the
  # outdated on MacOS
  #
  # On Mac we use Postgres.app
  path=(
    /usr/local/{bin/sbin}
    /Applications/Postgres.app/Contents/Versions/9.4/bin
    $path
  )

  if [ -d /usr/texbin ]; then
    path=(
      /usr/texbin
      $path
    )
  fi
fi

# Set the basic list for the path
path=(
  /usr/local/{bin/sbin}
  $path
);

# If there's ~/bin then add it to the path
if [[ -d $HOME/bin ]]; then
  path=(
    $HOME/bin
    $path
  );
fi

# If there's the Heroku Toolbelt installed then load it to the path
if [[ -d /usr/local/heroku/bin ]]; then
  path=(
    /usr/local/heroku/bin
    $path
  );
fi

# If there's a ~/gocode folder, then there's where $GOPATH should point to.
if [[ -d $HOME/gocode ]]; then
  export GOPATH=~/gocode/bin;
fi

# If there's $NAVEPATH then load it to the $PATH
if [[ -n $NAVEPATH ]]; then
  path=(
    $NAVEPATH
    $path
  );
fi

# If it's a mac then run ulimit -n 8192 because it sucks the little amount
# of concurrent files that can be open
if [[ "$OSTYPE" == darwin* ]]; then
  ulimit -n 8192;
fi

# Temporary files

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER";
  mkdir -p -m 700 "$TMPDIR";
fi

TMPPREFIX="${TMPDIR%/}/zsh";
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX";
fi
