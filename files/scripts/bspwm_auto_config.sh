# Cleanup old desktops
for DESKTOP in $(bspc query -D)
do
    bspc desktop $DESKTOP -r
done

# Setup new desktops
readonly SCREENS_NO=$(bspc query -M | wc -l)
readonly SCREEN_BUILTIN="eDP-1"

if [ "$SCREENS_NO" == "1" ]
then
    bspc monitor "$SCREEN_BUILTIN" -d 1 2 3 4 5
    exit 0
elif [ "$SCREENS_NO" == "2" ]
then
    for MONITOR in $(bspc query -M --names); do
        if [ "$MONITOR" == "$SCREEN_BUILTIN" ]
        then
            bspc monitor "$MONITOR" -d 1 2 3
        else
            echo "$MONITOR"
            bspc monitor "$MONITOR" -d 4 5
        fi
    done
fi
