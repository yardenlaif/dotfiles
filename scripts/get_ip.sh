#!/bin/bash

ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2
