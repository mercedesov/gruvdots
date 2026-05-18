#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

if [[ "$SELECTED" == "true" ]]; then
  sketchybar --animate sin 15 --set "$NAME" icon.color=0xff9d9078
else
  sketchybar --animate sin 15 --set "$NAME" icon.color=0x889d9078
fi

