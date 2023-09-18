#!/bin/bash


airpods=$(bluetoothctl devices 2>&1 | grep "Yarden’s AirPods Max" | cut -d" " -f2)
command=$(bluetoothctl info $airpods | grep Connected | grep -q no && echo "connect" || echo "disconnect")
bluetoothctl $command $airpods
