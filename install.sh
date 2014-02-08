#!/bin/bash

here=$(cd $(dirname $0) && pwd)
files=$(find $here -mindepth 1 -maxdepth 1)
for a in $files; do
    b=$(basename $a)
    cp -r $a $HOME/.${b:1}
done
