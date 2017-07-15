set -g prefix F12
unbind-key -n C-a
set -g prefix `
bind ` send-prefix

# spacemacs-like window management keys
unbind h
unbind j
unbind k
unbind l
unbind /
unbind -

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind / display-panes \; split-window -h -c "#{pane_current_path}"
bind - display-panes \; split-window -v -c "#{pane_current_path}"
