#!/bin/bash


command=$(twingate status | grep -q online && echo "stop" || echo "start")
notify-send "Running twingate $command, please enter your password"
SUDO_ASKPASS=/usr/bin/ssh-askpass twingate $command > /tmp/tg.log 2>&1
