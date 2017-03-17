# Path to Oh My Fish install.
set -gx OMF_PATH "/home/pxc/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/pxc/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# for some reason the OMF plugin doesn't take care of this in some cases (namely new tmux panes)
eval (direnv hook fish)
