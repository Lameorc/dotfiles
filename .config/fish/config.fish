#!/usr/bin/fish

set FISH_HOME "$HOME/.config/fish"

# Fedora is fricking retarded otherwsie
umask 022

# use vim editor
set -gx EDITOR nvim

# use firefox as browser
set -gx BROWSER (which firefox)

# Ansible is freaking retarded otherwise and it seems to ignore it's config
set -gx ANSIBLE_NOCOWS 1

# abbreviations file
source "$FISH_HOME/abbr.fish"
# misc functions
source "$FISH_HOME/functions/misc.fish"
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

set -gx GOPATH ~/Code/go
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

# use kube prompt as right prompt
function _tide_item_kubectx_prompt
    set_color blue
    printf "☸ %s(ns:%s)" (kubectx -c) (kubens -c)
end

set -g tide_pwd_truncate_margin 67
set -g tide_kubectx_prompt_bg_color black
set -g tide_right_prompt_items status cmd_duration context jobs virtual_env vi_mode time newline kubectx_prompt

# add snap desktop entries for launcher
set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/snapd/desktop/"

# pipx autocomplete
register-python-argcomplete --shell fish pipx | source
# pipx binary path
set -x PATH /home/newmark/.local/bin $PATH

# use starship prompt
# starship init fish | source

# Created by `pipx` on 2022-05-31 09:14:49
set PATH $PATH /home/vpodhajsky/.local/bin

# ADR tools
set -x PATH $PATH $HOME/Code/npryce/adr-tools/src

# direnv
direnv hook fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/vpodhajsky/anaconda3/bin/conda
    eval /home/vpodhajsky/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

