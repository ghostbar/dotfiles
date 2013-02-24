all: bash zsh tmux powerline git vim

bash:
	ln -s $(CURDIR)/bashrc $(HOME)/.bashrc
	ln -s $(CURDIR)/profile $(HOME)/.profile
	ln -s $(CURDIR)/bash_vars $(HOME)/.shenv
	ln -s $(CURDIR)/logout $(HOME)/.logout
	ln -s $(CURDIR)/aliases $(HOME)/.aliases

zsh: bash
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/zsh $(HOME)/.zsh

powerline:
	mkdir $(HOME)/.config
	ln -s $(CURDIR)/powerline $(HOME)/.config/powerline

git:
	ln -s $(CURDIR)/gitignore $(HOME)/.gitignore
	ln -s $(CURDIR)/gitconfig $(HOME)/.gitconfig

tmux:
	ln -s $(CURDIR)/tmux.conf $(HOME)/.tmux.conf

vim:
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/vim $(HOME)/.vim
