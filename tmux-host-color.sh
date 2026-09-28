#!/bin/sh
# Hash the short hostname into a readable 256-color palette. Use the calling
# server's socket so this also works with tmux -L / -S and nested servers.
set -eu
host_name=$(tmux -S "$1" display-message -p '#{host_short}')
checksum=$(printf '%s' "$host_name" | cksum)
checksum=${checksum%% *}
case $((checksum % 8)) in
    0) accent=colour75 ;;  # blue
    1) accent=colour209 ;; # coral
    2) accent=colour114 ;; # green
    3) accent=colour180 ;; # gold
    4) accent=colour141 ;; # purple
    5) accent=colour80 ;;  # cyan
    6) accent=colour218 ;; # pink
    7) accent=colour215 ;; # orange
esac
tmux -S "$1" set-option -g @host-color "$accent"
