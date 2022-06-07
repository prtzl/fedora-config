#! /usr/bin/env sh

rcfile=$HOME/.cache/winstate

if [[ $1 == "save" ]]; then
    echo "Goin to sleep, save window states!"
    wmctrl -lG > ${rcfile}
    exit
elif [[ $1 != "restore" ]]; then
    echo "Invalid message, not saving nor restoring window states!"
    exit
fi

if [ -z $(find $HOME/.cache -name winstate) ]; then
    echo "Winstate file not found, not restoring!"
    exit
fi

while read row; do
  IFS=" " read id g x y w h _ <<< ${row}
  wmctrl -ir ${id} -e 0,${x},${y},${w},${h}
done < ${rcfile}

