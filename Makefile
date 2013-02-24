all: bash zsh tmux powerline git

bash:
	ln -s $(CURDIR)/bashrc $(HOME)/.bashrc
	ln -s $(CURDIR)/bash_profile $(HOME)/.bash_profile
	ln -s $(CURDIR)/bash_vars $(HOME)/.bash_vars

zsh:
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/zsh $(HOME)/.zsh

powerline:
	mkdir $(HOME)/.config
	ln -s $(CURDIR)/powerline $(HOME)/.config/powerline

dummy:
	echo $(HOME)
	echo $(CURDIR)
