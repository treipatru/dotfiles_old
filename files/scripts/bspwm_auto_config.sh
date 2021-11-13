readonly SCREENS=$(xrandr| rg '\sconnected' | awk '{print $1}')
readonly SCREENS_NO=$(wc -w <<< $SCREENS)
readonly SCREEN_BUILTIN="eDP-1"

if [ "$SCREENS_NO" == "1" ]
then
    xrandr --output $SCREEN_BUILTIN --primary --mode 1920x1080 --rotate normal &&
    bspc monitor $SCREEN_BUILTIN -d 1 2 3 4 5
elif [ "$SCREENS_NO" == "2" ]
then
    ## Considering built-in screen is always second in list
    readonly SCREEN_SECOND=$(echo $SCREENS | awk '{print $2}')

    xrandr --output $SCREEN_BUILTIN --primary --mode 1920x1080 --rotate normal \
           --output $SCREEN_SECOND --mode 1920x1080 --rotate normal --left-of $SCREEN_BUILTIN

    bspc monitor $SCREEN_BUILTIN -d 1 2 3
    bspc monitor $SCREEN_SECOND -d 4 5
fi
