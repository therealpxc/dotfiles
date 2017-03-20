# takes a pattern, a list of capturing group names, and a string.
# 
# returns an expr which, when evaluated, sets a variable for each named matching group
# in the pattern
function gather_regex_matches -a pattern str
  if test (count $argv) -lt 3
    echo __gather_regex_matches: invalid number of arguments 1>&2
    return 1
  end
  
  # the third argument and all arguments after 
  set -l selected $argv[(seq 3 (count $argv))]
  set -l matches (string replace -r $pattern (rearray $selected) -- $str)

  set -l i 0
  for name in $selected
    set i (math $i + 1)
    echo set $name $matches[$i]';'
  end;  set -lu i
end
