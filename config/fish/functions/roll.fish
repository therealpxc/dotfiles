function roll
  function rollspec
    set -l reps_pattern '(?:(?<reps>\d+)x)'
    set -l count_pattern '(?<count>\d*)'
    set -l mod_pattern '(?<op>[\-+])(?<mod>\d+)'
    set -l arg_pattern (string join '' \
      "(?<__has_reps>(?:$reps_pattern?))" \
      "(?:(?<__has_count>(?:"$count_pattern"))d)?" \
      '(?<sides>\d+)' \
      "(?<__has_mod>(?:$mod_pattern)?)")

    ### ↓ begin parsing sole argument ↓ ###
    set -l base_match_names __has_reps __has_count __has_mod sides
    set -l base_matches (string replace -r $arg_pattern (rearray $base_match_names) $argv[1])
    set -l i 0
    for option in $base_match_names
      set i (math $i + 1)
      set $option $base_matches[$i]
    end;  set -lu i
    
    set -l reps 1
    if test -n $__has_reps
      set reps (string replace -r $reps_pattern '${reps}' $__has_reps)
    end

    set -l count 1
    if test -n $__has_count
      set count (string replace -r $count_pattern '${count}' $__has_count)
    end

    set -l mod 0
    set -l op +
    if test -n $__has_mod
      set -l i 0
      for option in op mod
        set i (math $i + 1)
        set -l mod_groups (string replace -r $mod_pattern (rearray op mod) -- $__has_mod)
        set $option $mod_groups[$i]
      end;
    end
    ### ↑ end parsing argument ↑ ###

    set -l rolls
    echo rolling $argv[1]:
    for rep in (seq 1 $reps)
      for roll in (seq 1 $count)
        set rolls[$roll] (random 1 $sides)
      end

      set -l rolls_sum_str
      set rolls_sum_str (string join ' + ' $rolls)
      
      echo -n -e '\t'
      if test -n $__has_mod; and test $count -ne 1
        echo -n '('
      end
      echo -n $rolls_sum_str
      if test -n $__has_mod; and test $count -ne 1
        echo -n ')'
      end
      echo -n ' '
      if test -n $__has_mod
        echo -n [$op$mod] ''
      end
      # why doesn't this conditional work right
      if test -n $__has_mod -o $count -ne 1
        echo = (math '(' $rolls_sum_str ')' $op $mod)
      else
        echo
      end
    end
  end

  for spec in $argv
    rollspec $spec
  end
end
