## Colors
black='colour16'
white='colour255'
gray='colour236'
dark_gray='colour236'
yellow='colour215'
light_purple='colour141'
dark_purple='colour61'

## Icons
left_sep=''
right_sep=''
right_alt_sep=''

set-option -g status on
set-option -g status-left-length 100
set-option -g status-right-length 100
set-option -g status-bg "${dark_gray}"
set-option -g pane-active-border-fg "${dark_purple}"
set-option -g pane-border-fg "${gray}"
set-option -g message-bg "${gray}"
set-option -g message-fg "${white}"
set-option -g message-command-bg "${gray}"
set-option -g message-command-fg "${white}"
set-option -g status-left " #I #[fg=${dark_gray},reverse]${right_sep} "
set-option -g status-left-style "fg=${white},bg=${dark_purple},bold"
set-option -g status-right "${left_sep}#[bg=${black},reverse] %Y-%m-%d %H:%M "
set-option -g status-right-style "fg=${light_purple},bg=${dark_gray}"
set-window-option -g window-status-activity-style "fg=${white},bg=${gray}"
set-window-option -g window-status-separator ''
set-window-option -g window-status-format ' #I #W '
set-window-option -g window-status-style "fg=${yellow},bg=${dark_gray}"
set-window-option -g window-status-current-format \
"${right_sep}#[fg=${black}] #I ${right_alt_sep} #W #[fg=${dark_gray},reverse]${right_sep}"
set-window-option -g window-status-current-style "fg=${dark_gray},bg=${light_purple}"
