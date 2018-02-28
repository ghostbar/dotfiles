#!/usr/bin/env zsh

help='
Usage:

zsh install.zsh [-v|--version] [-h|--help] [-a|--all] \
  [-z|--zsh] [-g|--git] [-t|--tmux]

Options:

-v/--version          - Print version
-h/--help             - Print help
-a/--all              - Install all config
-z/--zsh              - Install Zsh config
-g/--git              - Install Git config
-t/--tmux             - Install Tmux config
';

version='
Version: 1.0.0
© 2013-2015, Jose-Luis Rivas <me@ghostbar.co>
Licensed under the MIT terms.
';

# checkFile()
# -----------
#
# Checks if a file exists on $HOME, if it does then adds it the suffix
# .bak
#
# Arguments:
# + path of file on $HOME
# + path of file on $PWD
#
# Example:
#
# checkFile pathOnHome pathOnPwd
# checkFile config/crazy crazy
# -> will check ~/.config/crazy and $PWD/crazy, if true then moves
# ~/.config/crazy to ~/.config/crazy.bak
#
function checkFile {
  if [[ -e $HOME/.$1 && -e $PWD/$2 ]]; then
    mv $HOME/.$1 $HOME/.$1.bak;
  fi
}

# lnFile()
# -----------
#
# Links a file from $PWD to $HOME.
#
# Arguments:
# + path of file on $HOME
# + path of file on $PWD
#
# Example:
#
# lnFile pathOnHome pathOnPwd
# lnFile config/crazy crazy
# -> will link to ~/.config/crazy from $PWD/crazy
#
function lnFile {
  if [[ -e $PWD/$2 ]]; then
    print "Linking" $PWD/$2 "to" $HOME/.$1;
    ln -s $PWD/$2 $HOME/.$1;
  fi
}

# checkDir()
# ----------
#
# Checks if a directory exists in $HOME and if it does add's it the suffix
# .bak.
#
# Arguments:
# + path of dir on $HOME
# + path of dir on $PWD
#
# Example:
#
# checkDir pathOnHome pathOnPwd
# checkDir config/crazy crazy
# -> will check if ~/.config/crazy exists and $PWD/crazy, if true then moves
# ~/.config/crazy to ~/.config/crazy.bak
#
function checkDir {
  if [[ -d $HOME/.$1.bak ]]; then
    rm -rf $HOME/.$1.bak;
  fi

  if [[ -d $HOME/.$1 && -d $PWD/$2 ]]; then
    mv $HOME/.$1 $HOME/.$1.bak
  fi
}

function zshEnvFiles {
  checkFile zlogout zshfiles/zlogout;
  lnFile zlogout zshfiles/zlogout;
  checkFile zpreztorc zshfiles/zpreztorc;
  lnFile zpreztorc zshfiles/zpreztorc;
  checkFile zprofile zshfiles/zprofile;
  lnFile zprofile zshfiles/zprofile;
  checkFile zshenv zshfiles/zshenv;
  lnFile zshenv zshfiles/zshenv;
  checkFile aliases zshfiles/aliases;
  lnFile aliases zshfiles/aliases;
}

function zsh {
  print 'Linking zsh configuration';

  checkFile zshrc zshfiles/zshrc;
  checkDir zsh zshfiles/zsh;

  zshEnvFiles;

  if [[ -e $PWD/zshfiles/zshrc && -d $PWD/zshfiles/zsh ]]; then
    ln -s $PWD/zshfiles/zshrc ~/.zshrc;
    ln -s $PWD/zshfiles/zsh ~/.zsh;
    print 'Your zsh configuration is ready to be used.';
  else
    print "There's no zsh config files in the current directory, maybe you are in the wrong one.";
  fi
}


function git {
  print 'Linking git configuration';

  checkFile gitignore gitfiles/gitconfig;

  if [[ -e $PWD/gitfiles/gitignore ]]; then
    ln -s $PWD/gitfiles/gitignore ~/.gitignore;
  fi

  checkFile gitconfig gitfiles/gitconfig;

  if [[ -e $PWD/gitfiles/gitconfig ]]; then
    ln -s $PWD/gitfiles/gitconfig ~/.gitconfig;
  fi

  if [[ -e $PWD/gitfiles/gitconfig && -e $PWD/gitfiles/gitignore ]]; then
    print 'Your git configuration is ready to be used.';
  else
    print "There's no git files found in the current directory, maybe you are in the wrong one.";
  fi
}

function tmux {
  print 'Linking tmux configuration';

  checkFile tmux.conf tmuxfiles/tmux.conf;

  if [[ "$OSTYPE" == darwin* ]]; then
    checkFile tmux.darwin.conf tmuxfiles/tmux.darwin.conf;
    lnFile tmux.darwin.conf tmuxfiles/tmux.darwin.conf;
  fi

  if [[ "$OSTYPE" == linux* ]]; then
    checkFile tmux.linux.conf tmuxfiles/tmux.linux.conf;
    lnFile tmux.linux.conf tmuxfiles/tmux.linux.conf;
  fi

    checkFile tmux.nord.conf tmuxfiles/tmux.nord.conf;
    lnFile tmux.nord.conf tmuxfiles/tmux.nord.conf;

  if [[ -e $PWD/tmuxfiles/tmux.conf ]]; then
    ln -s $PWD/tmuxfiles/tmux.conf ~/.tmux.conf;
    print "Your tmux configuration is ready to be used.";
  else
    print "There's no" $PWD/tmuxfiles/tmux.conf", maybe you are in the wrong directory";
  fi

}

function showHelp {
  print $version;
  print $help;
}

while test -n "$1"; do
  case $1 in
    (-v|--version)
      print $version;
      exit 0;;
    (-a|--all)
      print "Will install everything";
      zsh;
      git;
      tmux;
      exit 0;;
    (-z|--zsh)
      envFiles;
      zsh;
      exit 0;;
    (-g|--git)
      git;
      exit 0;;
    (-t|--tmux)
      tmux;
      exit 0;;
    (*)
      showHelp;
      exit 0;;
  esac
done

if test -z $1; then
  showHelp;
  exit 0;
fi
