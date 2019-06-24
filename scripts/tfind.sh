#~/bin/bash
case $# in
1)
find -name "$1";;
2)
find $2 -name "$1";;
esac
