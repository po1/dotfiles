#!/bin/sh

check_and_set()
{
    local name=$1
    local value=$2

    if grep -q "^export $name" $HOME/.profile; then
        sed -i "s,^export $name=.*,export $name=$value," $HOME/.profile
    else
        echo "export $name=$value" >> ~/.profile
    fi
}

check_and_set EDITOR vim
check_and_set LANG "en_US.UTF-8"

mkdir -p $HOME/bin

if ! grep -q 'PATH=$HOME/bin:' ~/.profile; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.profile
fi
