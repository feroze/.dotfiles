#!/bin/bash

if [ "$HOSTNAME" = ryzen ]; then
    i3-msg 'workspace 1; exec google-chrome https://coggle.it/diagram/WfSw7O1FsAABYsPL --new-window;'
    #i3-msg 'workspace 2; exec google-chrome https://calendar.google.com/calendar/render#g --new-window;'
else
    i3-msg 'workspace 1; exec google-chrome https://outlook.office.com/owa/#authRedirect=true --new-window;'
fi
