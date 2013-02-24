# User Dotfiles from Jose Luis Rivas #

## What's inside
Basically there are lots of configuration dotfiles for:

+	Awesome WM (old and not longer used)
+	Bash (including extra file *~/.bash_vars* )
+	Git
+	SSH
+	Vim
+	dput
+	irssi
+	GPG
+	svn-buildpackage
+	Xdefaults and xinitrc
+ offlineimap
+ msmtp
+ tmux
+ Ferm (front-end for iptables/ip6tables)

## How are presented:
There are no *.something* but normal files that I use by simply making symbolic links to your `$HOME` (this can be done using the `Makefile`).

## How can be used
You can check some configs, there are not a lot of comments but sometimes I made them. I'm very happy with my Vim configuration (with snipmate and stuff) and you could like how it works, probably.

Any question will be answered better by using manpages that by asking me.

If you want to use them as they are then the best method is to use the `Makefile` targets, depending on what you want. So, if you want `bash` and `vim` you should use:

  % make bash
  % make vim

## License and Copyright
These files are released under the MIT-license. Please retain the copyright on the files.

© 2009-2012, Jose Luis Rivas `<ghostbar at debian.org>`

## Contact
You can contact me on twitter at [@ghostbar](http://www.twitter.com/ghostbar) or via email at `<joseluis at rivco.net>`.

You can check my blog too, is at: [http://ghostbar.ath.cx](http://ghostbar.ath.cx)
