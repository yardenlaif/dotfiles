#!/bin/zsh

gpbin=$(which globalprotect)
echo $gpbin
sh -c "`which globalprotect` show --status"
# command=$(sh globalprotect show --status | grep -q Connected && echo "disconnect" || echo "connect")
# echo "$command"
# globalprotect "$command"
