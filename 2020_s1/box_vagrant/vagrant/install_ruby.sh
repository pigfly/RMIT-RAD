#!/usr/bin/env bash
source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh

rvm use --default --install $1

rvm cleanup all