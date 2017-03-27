type -q keychain
and status --is-interactive
and eval (env SHELL=fish keychain --eval --quiet -Q --agents ssh)

