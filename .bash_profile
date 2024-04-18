#!/bin/bash

# Uncomment to activate ssh keychain
#keychain $HOME/.ssh/id_rsa
#source $HOME/.keychain/$HOSTNAME-sh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
