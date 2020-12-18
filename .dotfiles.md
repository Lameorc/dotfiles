# dotfiles

based on https://www.atlassian.com/git/tutorials/dotfiles

# Quickstart
```
git clone --bare git@github.com:Lameorc/dotfiles.git  $HOME/.dotfiles
# clean up conflicting confings
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv checkout
# install missing dependencies based on shell errors
```
