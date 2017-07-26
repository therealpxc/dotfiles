# Don't load oh-my-fish for non-interactive shells. Hopefully this will speed
# up Emacs/Spacemacs' helm-projectile stuff.
if not builtin status is-interactive
  exit  
end

# nix-darwin's fish module is still broken, so we have to do this to get our
# Nix profiles on the path. It will be sourced a second time, though, unfortunately.
# This means we get clobberage. ;'(
if test (uname) = Darwin
  source /etc/static/fish/config.fish
end

# Path to Oh My Fish install.
set -gx OMF_PATH ~/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG ~/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

