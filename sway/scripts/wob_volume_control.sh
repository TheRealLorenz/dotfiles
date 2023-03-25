#!/bin/bash

WOBSOCK=$XDG_RUNTIME_DIR/wob.sock

toggle_mute() {
  pamixer -t
  if $(pamixer --get-mute); then
    echo 0 > $WOBSOCK
  else
    pamixer --get-volume > $WOBSOCK
  fi
}

raise() {
  pamixer -ui 5
  pamixer --get-volume > $WOBSOCK
}

lower() {
  pamixer -ud 5
  pamixer --get-volume > $WOBSOCK
}

toggle_mute_source() {
  pamixer --default-source -t
  if $(pamixer --default-source --get-mute); then
    echo 0 > $WOBSOCK
  else
    pamixer --default-source --get-volume > $WOBSOCK
  fi
}

raise_source() {
  pamixer --default-source -ui 2
  pamixer --default-source --get-volume > $WOBSOCK
}

lower_source() {
  pamixer --default-source -ud 2
  pamixer --default-source --get-volume > $WOBSOCK
}

case $1 in
  toggle_mute)
    toggle_mute
    ;;

  raise)
    raise
    ;;

  lower)
    lower
    ;;

  toggle_mute_source)
    toggle_mute_source
    ;;

  raise_source)
    raise_source
    ;;

  lower_source)
    lower_source
    ;;

  *)
    echo "Invalid argument $1"
esac

