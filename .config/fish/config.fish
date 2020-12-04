#!/usr/bin/fish

set FISH_HOME "$HOME/.config/fish"

# Fedora is fricking retarded otherwsie
umask 022

# use vim editor
set -gx EDITOR nvim

# Ansible is freaking retarded otherwise and it seems to ignore it's config
set -gx ANSIBLE_NOCOWS 1

# abbreviations file
source "$FISH_HOME/abbr.fish"
# misc functions
source "$FISH_HOME/functions/misc.fish"
# secrets
source "$FISH_HOME/secrets.fish"
# ssh-agent autostart
setenv SSH_ENV $HOME/.ssh/environment

# remap vim to use neovim
alias vim-old (which vim)
alias vim nvim

# use xterm-256colors terminfo on SSH
alias ssh="env TERM=xterm ssh"
alias alacritty="env WINIT_X11_SCALE_FACTOR=1.2 alacritty"

set -x PATH "$HOME/bin" "/snap/bin" $PATH


set -x PATH "$HOME/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

set -gx GOPATH (go env GOPATH)
set -x PATH "$GOPATH/bin" $PATH

# tfenv
set -gx PATH "$HOME/code/tfenv/bin" $PATH

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
if test -e $OMF_PATH/init.fish
    source $OMF_PATH/init.fish
end

# add snap desktop entries for launcher
set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/snapd/desktop/"


# use starship prompt - slow as hell consider later
# starship init fish | source

# pipx autocomplete
register-python-argcomplete --shell fish pipx | source
# pipx binary path
set -x PATH /home/newmark/.local/bin $PATH
