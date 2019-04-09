set -gx theme_title_display_user yes
set -gx theme_nerd_fonts yes
set -gx theme_newline_cursor yes
set -gx theme_show_exit_status yes
set -gx theme_git_worktree_support yes
set -gx theme_display_vagrant yes

if string match -q --regex "$TERM" "emacs|dumb"
  function fish_prompt
    echo -n "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end
