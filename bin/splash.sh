#!/bin/bash

source ~/.bash_profile
RUN_PATH=`(cd "$(dirname "$0")" && pwd)`
export GEM_PATH="$GEM_PATH:$HOME/.rvm/gems/ruby-2.4.6"
~/.rvm/rubies/ruby-2.4.6/bin/ruby $RUN_PATH/splash.rb
