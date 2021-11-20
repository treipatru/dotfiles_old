#!/usr/bin/env python3
#
# Auto configure screens and bspwm desktops
#
import os

######################################################################
def get_list_from_os(command):
    """
    Get a list from lines output by the stdout of an os command.

    :param command string: command to be executed
    :returns: os command output lines
    :rtype: list
    """
    stream = os.popen(command)
    output = stream.readlines()

    for i, monitor in enumerate(output):
        output[i] = monitor.strip()

    return output

def get_builtin_monitor(connected, builtin):
    """
    Get the name of the builtin monitor.

    :param connected list: list of connected monitors
    :param builtin list: list of possible builtin monitor names
    :returns: the name of the builtin monitor
    :rtype: string
    """
    for elem in connected:
        if builtin.count(elem) == 1:
            return elem

def set_bspwm_desktop(monitor, desktops):
    """
    Assign bspwm desktops to monitor

    :param monitor string: name of monitor
    :param desktops string: name of desktop
    """
    os.system(f"bspc monitor {monitor} -d {desktops}")

def set_xrandr(monitors):
    """
    Setup monitors using xrandr. This method loops through a list of monitors,
    creates a string with the xrandr options then launches the command.

    :param monitors list: list of dictionaries representing monitors and their options
    """
    xrandr_cmd = "xrandr"

    for monitor in monitors:
        xrandr_cmd += f" --output {monitor['name']}"

        if "primary" in monitor:
            xrandr_cmd += " --primary"

        if "position" in monitor and "anchor" in monitor:
            xrandr_cmd += f" --{monitor['position']} {monitor['anchor']}"

    os.system(xrandr_cmd)

def remove_monitors(connected, bspwm):
    """
    Remove unconnected monitors from bspwm.

    :param connected list: connected monitors as listed by xrandr
    :param bspwm list: monitors as listed by bspc query
    """
    for monitor in bspwm:
        if monitor not in connected:
            os.system(f"bspc monitor {monitor} --remove > /dev/null")
            print(monitor)

######################################################################
MONITORS_BUILTIN = ["eDP-1", "eDP1"]
monitors_bspwm = get_list_from_os("bspc query --monitors --names")
monitors_connected = get_list_from_os("xrandr| grep ' connected' | awk '{print $1}'")
monitors_count = len(monitors_connected)
monitor_builtin = get_builtin_monitor(monitors_connected, MONITORS_BUILTIN)

remove_monitors(monitors_connected, monitors_bspwm)

monitors_connected.remove(str(monitor_builtin))

if monitors_count == 1:
    set_xrandr([
        { "name": monitor_builtin, "primary": True },
        ])

    set_bspwm_desktop(monitor_builtin, "1 2 3 4 5")

elif monitors_count == 2:
    monitor_secondary = monitors_connected[0]

    set_xrandr([
        { "name": monitor_builtin,   "primary": True },
        { "name": monitor_secondary, "position": "right-of", "anchor": monitor_builtin},
        ])

    set_bspwm_desktop(monitor_builtin, "1 2 3")
    set_bspwm_desktop(monitor_secondary, "4 5")

elif monitors_count == 3:
    monitor_secondary = monitors_connected[0]
    monitor_tertiary = monitors_connected[1]

    set_xrandr([
        { "name": monitor_builtin,   "primary": True },
        { "name": monitor_secondary, "position": "right-of", "anchor": monitor_builtin},
        { "name": monitor_tertiary,  "position": "below",    "anchor": monitor_secondary},
        ])

    set_bspwm_desktop(monitor_builtin,   "1 2 3")
    set_bspwm_desktop(monitor_secondary, "4")
    set_bspwm_desktop(monitor_tertiary,  "5")
