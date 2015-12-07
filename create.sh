#!/bin/bash
# Copyright 2015 Felix Wolfsteller
# Released under the GPL

# Create 7linden-cp-login**.deb

fpm -s dir\
    -t deb\
    -v `cat VERSION`\
    -a all\
    --name "7linden-cp-login"\
    --description "Manually login to captive portal"\
    --directories opt/7linden-cp-login\
    --depends bash\
    --depends wget\
    --depends whiptail\
    --depends openssh-client\
    --depends diffutils\
    --license "GPLv3"\
    --maintainer "felix.wolfsteller@gmail.com"\
    --after-install scripts/after-install\
    etc opt
# --after-install --after-remove
