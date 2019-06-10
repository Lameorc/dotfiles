#!/usr/bin/fish

set FISH_HOME "$HOME/.config/fish"


# use vi mode and vim editor
fish_vi_key_bindings
set -gx EDITOR vim

# abbreviations file
source "$FISH_HOME/abbr.fish"
# misc functions
source "$FISH_HOME/functions/misc.fish

# remap vim to use neovim
alias vim-old (which vim)
alias vim nvim


set -x PATH "/home/vojta/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

eval (python3 -m virtualfish)

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# szn specific
source "$FISH_HOME/szn.fish"

