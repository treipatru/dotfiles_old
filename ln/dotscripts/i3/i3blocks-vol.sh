#!/bin/bash

VOL=$(pamixer --get-volume)

if (($VOL==0))
then
    LBL=''
elif ((1<=$VOL && $VOL<=30))
then
    LBL=''
elif ((31<=$VOL && $VOL<=60))
then
    LBL=''
else
    LBL=''
fi

echo "<span font_desc='Font Awesome 5 Free'>${LBL}</span><span color='#3f516b'> ${VOL}</span>"
