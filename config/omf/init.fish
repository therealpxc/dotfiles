alias j z
alias ls "ls --color=auto"

function n
  nix-env -f '<nixpkgs>' $argv
end

# my theme is virtualenv-aware, so we don't need the builtin prompt adjustment from the activation scripts
set -gx VIRTUAL_ENV_DISABLE_PROMPT true
