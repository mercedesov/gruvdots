#!/bin/bash
opacity="${1:-0.90}"
sleep 0.5
/opt/homebrew/bin/yabai -m window "$YABAI_WINDOW_ID" --opacity "$opacity"
