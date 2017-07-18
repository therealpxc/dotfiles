if test -e ~/.local/bin
  contains ~/.local/bin $PATH
  or set -gx PATH ~/.local/bin $PATH
end

