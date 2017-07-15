type -q keychain
and builtin status --is-interactive
and eval (env SHELL=fish keychain --eval --quiet -Q --agents ssh)

