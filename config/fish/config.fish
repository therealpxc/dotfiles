# top-level configuration which runs for all shells goes here
# or in ./conf.d/some-config-file.fish
#

# this is here instead of a snippet because with nix-darwin the PATH gets clobbered (it needs the same kind of fix as on NixOS)
if test -e ~/.local/bin
  contains ~/.local/bin $PATH
  or set -gx PATH ~/.local/bin $PATH
end

