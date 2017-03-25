function roll
  function rollspec -a spec
    # Creates a fish regex replacement string using the supplied arguments as
    # matching group names'
    function rearray
      # these escapes are minimal. the '\n' literals need to be included so this
      # can be passed unescaped to (string replace $pattern $whatever $source)
      string join '\n' (string replace -r '.+' '\\\$\{$0\}' $argv)
    end

    function save_regex_matches -a pattern str
      if test (count $argv) -lt 3
        echo save_regex_matches: invalid number of arguments 1>&2
        return 1
      end
      
      # the third argument and all arguments after 
      set -l selected $argv[(seq 3 (count $argv))]
      set -l matches (string replace -r "$pattern" (rearray $selected) -- "$str")
      
      begin; set -l i 0; for name in $selected
        set i (math $i + 1)
        echo set $name $matches[$i]';'
      end; end
    end


    set -l reps_pattern '(?:(?<reps>\d+)x)'
    set -l count_pattern '(?<count>\d*)'
    set -l mod_pattern '(?<op>[\-+*])(?<mod>\d+)'
    set -l arg_pattern (string join '' \
      "(?<__has_reps>(?:$reps_pattern?))" \
      "(?:(?<__has_count>(?:$count_pattern))d)?" \
      '(?<sides>\d+)' \
      "(?<__has_mod>(?:$mod_pattern)?)")
    set -l base_match_names __has_reps __has_count __has_mod sides

    ### ↓ begin parsing sole argument ↓ ###
    eval (save_regex_matches "$arg_pattern" "$spec" $base_match_names)
    
    set -l reps 1
    test -n "$__has_reps"
      and eval (save_regex_matches $reps_pattern $__has_reps reps)

    set -l count 1
    test -n "$__has_count"
      and eval (save_regex_matches $count_pattern $__has_count count)


    set -l op +
    set -l mod 0
    test -n "$__has_mod"
      and eval (save_regex_matches $mod_pattern $__has_mod op mod)
    ### ↑ end parsing argument ↑ ###

    set -l rolls
    echo rolling $spec:
    for rep in (seq 1 $reps)
      for roll in (seq 1 $count)
        set rolls[$roll] (random 1 $sides)
      end

      set -l rolls_sum_str
      set rolls_sum_str (string join ' + ' $rolls)
      
      echo -n -e '\t'
      test -n "$__has_mod"; and test $count -ne 1
        and echo -n '('
      
      echo -n $rolls_sum_str
      test -n "$__has_mod"; and test $count -ne 1
        and echo -n ')'

      echo -n ' '
      test -n "$__has_mod"
        and echo -n [$op$mod] ''
      
      test -n "$__has_mod" -o "$count" -ne 1
        and echo = (math '(' $rolls_sum_str ')' $op $mod)
        or echo
    end
  end

  for spec in $argv
    rollspec $spec
  end
end
