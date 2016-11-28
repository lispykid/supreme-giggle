#!/bin/bash
#Script for rotating the screen and touchdevices on my Acer R11 Chromebook "CYAN" (11.11.2016 / Marcus Janietz)


STATE=`xrandr | grep eDP  | awk '{print $4}'`


echo $STATE
   if [[ $STATE == *"left"* ]]
   then
       xrandr -o inverted && xinput set-prop "Elan Touchscreen" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 # && xinput set-prop "Elan Touchpad" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
   else

     if [[ $STATE == *"inverted"* ]]
         then
             xrandr -o normal && xinput set-prop "Elan Touchscreen" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 && xinput reattach 11 3  && xinput set-prop "Elan Touchpad" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
         else
             xrandr -o left && xinput set-prop "Elan Touchscreen" "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 && xinput float 11 && /usr/bin/onboard # && xinput set-prop "Elan Touchpad" "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1

     fi
fi
