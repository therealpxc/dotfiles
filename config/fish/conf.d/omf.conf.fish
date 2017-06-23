if test (uname) = Darwin
  source /etc/static/fish/config.fish
end

# Path to Oh My Fish install.
set -gx OMF_PATH ~/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG ~/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

