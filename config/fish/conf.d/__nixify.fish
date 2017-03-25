# this is a workaround for the fact that fish doesn't source its config files
# in the order that it claims.

# ~/.config/fish/conf.d/*.fish gets sourced _before_ /etc/fish/config.fish,
# which on NixOS and my configuration means that OMF tries to load before
# it has paths to any executables. 😒

if not contains /run/current-system/sw/bin $PATH
  and test -e /run/current-system/sw/bin
  and test -e /etc/fish/config.fish
  source /etc/fish/config.fish
end
