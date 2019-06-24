#!/bin/bash

export CHOOSE_RESULT=""
export CACHE_DIR=$HOME/cache/
export TROOT=$HOME


function tg {
   . $HOME/script/tgrep.sh
}

function tf {
   . $HOME/script/tfind.sh
}

function xg {
   . $HOME/script/xgrep.sh
}

function jg {
   . $HOME/script/jgrep.sh
}

function mg {
   . $HOME/script/mgrep.sh
}

function tcd {
   # go to the specified dir, if $1 is given, go to $1 index of dir_history
   . $HOME/script/tgo $1
}

function troot {
   # go to root dir
   cd $TROOT
}

function ttroot {
   # save the root dir
   TROOT=$(pwd)
}
