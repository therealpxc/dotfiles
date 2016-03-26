alias status "builtin status"
function n
  nix-env -f '<nixpkgs>' $argv
end
