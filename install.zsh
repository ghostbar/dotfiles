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
  checkFile zlogout zlogout;
  lnFile zlogout zlogout;
  checkFile zpreztorc zpreztorc;
  lnFile zpreztorc zpreztorc;
  checkFile zprofile zprofile;
  lnFile zprofile zprofile;
  checkFile zshenv zshenv;
  lnFile zshenv zshenv;
  checkFile aliases aliases;
  lnFile aliases aliases;
}

function zsh {
  print 'Linking zsh configuration';

  checkFile zshrc zshrc;
  checkDir zsh zsh;

  zshEnvFiles;

  if [[ -e $PWD/zshrc && -d $PWD/zsh ]]; then
    ln -s $PWD/zshrc ~/.zshrc;
    ln -s $PWD/zsh ~/.zsh;
    print 'Your zsh configuration is ready to be used.';
  else
    print "There's no zsh config files in the current directory, maybe you are in the wrong one.";
  fi
}


function git {
  print 'Linking git configuration';

  checkFile gitignore gitconfig;

  if [[ -e $PWD/gitignore ]]; then
    ln -s $PWD/gitignore ~/.gitignore;
  fi

  checkFile gitconfig gitconfig;

  if [[ -e $PWD/gitconfig ]]; then
    ln -s $PWD/gitconfig ~/.gitconfig;
  fi

  if [[ -e $PWD/gitconfig && -e $PWD/gitignore ]]; then
    print 'Your git configuration is ready to be used.';
  else
    print "There's no git files found in the current directory, maybe you are in the wrong one.";
  fi
}

function tmux {
  print 'Linking tmux configuration';

  checkFile tmux.conf tmux.conf;

  if [[ "$OSTYPE" == darwin* ]]; then
    lnFile tmux.darwin.conf tmux.darwin.conf;
  fi

  if [[ "$OSTYPE" == linux* ]]; then
    lnFile tmux.linux.conf tmux.linux.conf;
  fi

  if [[ -e $PWD/tmux.conf ]]; then
    ln -s $PWD/tmux.conf ~/.tmux.conf;
    print "Your tmux configuration is ready to be used.";
  else
    print "There's no" $PWD/tmux.conf", maybe you are in the wrong directory";
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
