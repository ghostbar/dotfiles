#!/usr/bin/env zsh

help='
Usage:

zsh install.zsh [-v|--version] [-h|--help] [-a|--all] \
  [-b|--bash] [-z|--zsh] [-p|--powerline] [-g|--git] \
  [-t|--tmux]

Options:

-v/--version          - Print version
-h/--help             - Print help
-a/--all              - Install all config
-b/--bash             - Install Bash config
-z/--zsh              - Install Zsh config
-p/--powerline        - Install Powerline config
-g/--git              - Install Git config
-t/--tmux             - Install Tmux config
'

version='
Version: 0.2.0
© 2013-2014, Jose Luis Rivas <me@ghostbar.co>
Licensed under the MIT terms.
'

function bash {
  [ -e ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
  ln -s $PWD/bashrc ~/.bashrc

  [ -e ~/.profile ] && mv ~/.profile ~/.profile.bak
  ln -s $PWD/profile ~/.profile

  [ -e ~/.shenv ] && mv ~/.shenv ~/.shenv.bak
  ln -s $PWD/shenv ~/.shenv

  [ -e ~/.logout ] && mv ~/.logout ~/.logout.bak
  ln -s $PWD/logout ~/.logout

  [ -e ~/.aliases ] && mv ~/.aliases ~/.aliases.bak
  ln -s $PWD/aliases ~/.aliases
}

function zsh {
  [ -e ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
  ln -s $PWD/zshrc ~/.zshrc

  [ -d ~/.zsh ] && mv ~/.zsh/ ~/.zsh.bak/
  ln -s $PWD/zsh ~/.zsh
}

function powerline {
  [ ! -e ~/.config ] && mkdir ~/.config
  [ -e ~/.config/powerline ] && mv ~/.config/powerline ~/.config/powerline.bak/
  ln -s $PWD/powerline ~/.config/powerline
}

function git {
  [ -e ~/.gitignore ] && mv ~/.gitignore ~/.gitignore.bak
  ln -s $PWD/gitignore ~/.gitignore

  [ -e ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bak
  ln -s $PWD/gitconfig ~/.gitconfig
}

function tmux {
  print 'Linking tmux configuration';

  if [[ -e ~/.tmux.conf && -e $PWD/tmux.conf ]]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak;
  fi

  if [[ -e $PWD/tmux.conf ]]; then
    ln -s $PWD/tmux.conf ~/.tmux.conf;
    print "Your tmux configuration is ready to be used."
  else
    print "There's no" $PWD/tmux.conf", maybe you are in the wront directory"
  fi

}

function showHelp {
  print $version;
  print $help;
}

while test -n "$1"; do
  case $1 in
    (-v|--version)
      echo "$version";
      exit 0;;
    (-a|--all)
      echo "Install all configs\n";
      bash;
      zsh;
      powerline;
      git;
      tmux;
      exit 0;;
    (-b|--bash)
      echo "Install bash config\n";
      bash;
      exit 0;;
    (-z|--zsh)
      echo "Install Zsh config\n";
      bash;
      zsh;
      exit 0;;
    (-p|--powerline)
      echo "Install Powerline config\n";
      powerline;
      exit 0;;
    (-g|--git)
      echo "Install Git config\n";
      git;
      exit 0;;
    (-t|--tmux)
      echo "Install Tmux config\n";
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
