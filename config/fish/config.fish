# top-level configuration which runs for all shells goes here
# or in ./conf.d/some-config-file.fish

# for some reason the OMF plugin doesn't take care of this in some cases (namely new tmux panes)
eval (direnv hook fish)
