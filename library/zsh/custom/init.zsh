#
# Custom aliases/settings
#

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

#
# Grc (generic colorizer)
#

if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then
  source /usr/local/etc/grc.zsh

  # Supported commands
  cmds=(
    ip \
    curl \
    du \
    env \
    go \
    docker \
    id \
    uptime \
    tcpdump \
    who \
  );

  # Set alias for available commands.
  for cmd in $cmds ; do
    if (( $+commands[$cmd] )) ; then
      alias $cmd="grc --colour=auto $(whence $cmd)"
    fi
  done

  # Clean up variables
  unset cmds cmd
fi

#
# Input
#

# Change hex 0x15 to delete everything to the left of the cursor rather than the whole line.
bindkey "^U" backward-kill-line

# Add binding for Cmd+Shift+Z (redo).
bindkey "^X^_" redo


#
# fzf
#

if (( $+commands[fzf] )); then
  # Key bindings
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

  # Auto-completion
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
fi
