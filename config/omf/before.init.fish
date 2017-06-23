if test -e ~/.local/bin
  contains ~/.local/bin $PATH
  or set -gx PATH ~/.local/bin $PATH
end

function powerline-tmux-init --on-event zen.init
  powerline-config tmux setup
end
