#!/bin/sh

NAME="${NAME:-time_words}"

# force base-10
H=$(date +"%I"); H=$((10#$H))
M=$(date +"%M"); M=$((10#$M))

# round to nearest 5 minutes
M=$(( (M + 2) / 5 * 5 ))
if [ "$M" -eq 60 ]; then
  M=0
  H=$((H + 1))
fi

# wrap hour 1..12
[ "$H" -gt 12 ] && H=$((H - 12))
[ "$H" -eq 0 ] && H=12

hour_word() {
  case "$1" in
    1) echo "one";; 2) echo "two";; 3) echo "three";; 4) echo "four";;
    5) echo "five";; 6) echo "six";; 7) echo "seven";; 8) echo "eight";;
    9) echo "nine";; 10) echo "ten";; 11) echo "eleven";; 12) echo "twelve";;
  esac
}

minute_word() {
  case "$1" in
    5) echo "five";;
    10) echo "ten";;
    15) echo "quarter";;
    20) echo "twenty";;
    25) echo "twenty five";;
    30) echo "half";;
  esac
}

if [ "$M" -eq 0 ]; then
  OUT="$(hour_word "$H") o'clock"

elif [ "$M" -le 30 ]; then
  OUT="$(minute_word "$M") past $(hour_word "$H")"

else
  NEXT_H=$((H + 1))
  [ "$NEXT_H" -gt 12 ] && NEXT_H=1
  REM=$((60 - M))
  OUT="$(minute_word "$REM") to $(hour_word "$NEXT_H")"
fi

sketchybar --set "$NAME" label="$OUT"

