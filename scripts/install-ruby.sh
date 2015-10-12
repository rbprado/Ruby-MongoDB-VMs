#!/usr/bin/env bash

# This script is documented at https://rvm.io/integration/vagrant

source $HOME/.rvm/scripts/rvm

 rvm use --default --install $1

 shift

 if (( $# ))
 then gem install $@
 fi

 rvm cleanup all
