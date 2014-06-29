# vim: ft=zsh

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path;

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
  export GOPATH=~/gocode;
fi

# If there's a $GOPATH, then load it
if [[ -n $GOPATH ]]; then
  path=(
    $GOPATH 
    $path
  );
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
