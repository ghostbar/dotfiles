#!/bin/sh

help="
Options:

-v/--version          - Print version
-h/--help             - Print help
-a/--all              - Install all config
-b/--bash             - Install Bash config
-z/--zsh              - Install Zsh config
-p/--powerline        - Install Powerline config
-g/--git              - Install Git config
-t/--tmux             - Install Tmux config
"

version="
Version: 0.1.0
2013, Jose Luis Rivas <me@ghostbar.co>
Licensed under MIT terms.
"

bash() {
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
  ln -s $PWD/bashrc ~/.bashrc

  [ -f ~/.profile ] && mv ~/.profile ~/.profile.bak
  ln -s $PWD/profile ~/.profile

  [ -f ~/.shenv ] && mv ~/.shenv ~/.shenv.bak
  ln -s $PWD/shenv ~/.shenv

  [ -f ~/.logout ] && mv ~/.logout ~/.logout.bak
  ln -s $PWD/logout ~/.logout

  [ -f ~/.aliases ] && mv ~/.aliases ~/.aliases.bak
  ln -s $PWD/aliases ~/.aliases
}

zsh() {
  [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
  ln -s $PWD/zshrc ~/.zshrc

  [ -d ~/.zsh ] && mv ~/.zsh ~/.zsh.bak
  ln -s $PWD/zsh ~/.zsh
}

powerline() {
  ![ -d ~/.config ] && mkdir ~/.config
  ln -s $PWD/powerline ~/.config/powerline
}

git() {
  [ -f ~/.gitignore ] && mv ~/.gitignore ~/.gitignore.bak
  ln -s $PWD/gitignore ~/.gitignore

  [ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bak
  ln -s $PWD/gitconfig ~/.gitconfig
}

tmux() {
  [ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.bak
  ln -s $PWD/tmux.conf ~/.tmux.conf
}

while test -n "$1"; do
  case $1 in
    -v|--version)
      echo "$version";
      exit 0;;
    -a|--all)
      echo "Install all configs\n";
      bash;
      zsh;
      powerline;
      git;
      tmux;
      exit 0;;
    -b|--bash)
      echo "Install bash config\n";
      bash;
      exit 0;;
    -z|--zsh)
      echo "Install Zsh config\n";
      bash;
      zsh;
      exit 0;;
    -p|--powerline)
      echo "Install Powerline config\n";
      powerline;
      exit 0;;
    -g|--git)
      echo "Install Git config\n";
      git;
      exit 0;;
    -t|--tmux)
      echo "Install Tmux config\n";
      tmux;
      exit 0;;
    *)
      echo "$help";
      echo "$version";
      exit 0;;
  esac
done

if test -z $1; then
  echo "$help"; 
  echo "$version"; 
  exit 0;
fi
