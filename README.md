# Dotfiles

![Screenshot](https://i.cloudup.com/bwctuMts8t.png)

## What's inside
Basically there are lots of configuration dotfiles for:

+	Awesome WM (old and not longer used)
+ Basic Bash
+ Zsh (with prezto)
+	Git
+ tmux
+ powerline

## How are presented:
There are no *.something* but normal files that I use by simply making symbolic links to your `$HOME` (this can be done using the `install.zsh`).

## How can be used
You can check some configs, there are not a lot of comments but sometimes I made them. I'm very happy with my Vim configuration (with snipmate and stuff) and you could like how it works, probably.

Any question will be answered better by using manpages that by asking me.

If you want to use them as they are then the best method is to use the `install.zsh` targets, depending on what you want. So, if you want `bash` and `vim` you should use:

    % zsh install.zsh --bash
    % zsh install.zsh --vim

## Known issues

### While upgrading/with newer powerline

With the lastest `powerline`'s and the previous version of this repo (until ghostbar/dotfiles@e36c4c6c6905a57349022b1aff4e2e45709c4b4b) you may have encounter some issues specially with the configurations. I changed them so you should update to the latest available version here on GitHub to fix that issue.

## License and Copyright
Written from 2009 to 2014 by Jose Luis Rivas `<me@ghostbar.co>`

To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty. 

You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 
