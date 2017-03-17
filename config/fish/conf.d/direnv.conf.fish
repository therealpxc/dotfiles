# for some reason the OMF plugin doesn't take care of this in some cases
# (namely new tmux panes)
if type -q direnv
  eval (direnv hook fish)
end
