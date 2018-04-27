#!/bin/bash
# Disable caps lock; Use caps lock as control

xmodmap -e "keycode 66 = Control_L" ;
xmodmap -e 'clear Lock' ;
xmodmap -e 'add Control = Control_L';