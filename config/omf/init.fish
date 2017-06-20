alias j z
alias ls "ls --color=auto"

function n
  nix-env -f '<nixpkgs>' $argv
end
