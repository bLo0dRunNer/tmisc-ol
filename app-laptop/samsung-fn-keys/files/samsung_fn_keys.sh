#!/bin/bash

echo ""
echo ""
echo " * Piping Force Key Release:"
echo " * Key Event Codes for FN-Keys: 130,131,132,134,136,137,179,247,249 to: /sys/devices/platform/i8042/serio0/force_release"
echo 130,131,132,134,136,137,179,247,249 > /sys/devices/platform/i8042/serio0/force_release
echo ""

setkeycodes e002 227
echo " * setkeycodes e002 227 # Fn+F4 maps to switchvidmode"

setkeycodes e003 236
echo " * setkeycodes e003 236 # Fn+F2 maps to battery"

setkeycodes e004 148
echo " * setkeycodes e004 148 # Fn+F5 maps to prog1"

setkeycodes e006 238
echo " * setkeycodes e006 238 # Fn+F9 maps to wlan"

setkeycodes e008 225
echo " * setkeycodes e008 225 # Fn+Up maps to brightnessup"

setkeycodes e009 224
echo " * setkeycodes e009 224 # Fn+Dn maps to brightnessdown"

setkeycodes e031 149
echo " * setkeycodes e031 149 # Fn+F7 maps to prog2"

setkeycodes e033 202
echo " * setkeycodes e033 202 # Fn+F8 maps to prog3"

setkeycodes e077 191
echo " * setkeycodes e077 191 # Fn+F10 maps to F21 whenever the touchpad is enabled"

setkeycodes e079 192
echo " * setkeycodes e079 192 # Fn+F10 maps to F22 whenever the touchpad is disabled"

echo ""
