#!/usr/bin/env bash
v=110.91               # or whatever is the version you desire

sed s/__VERSION__/$v/g list.template > list.txt
if [ ! -d archives ]; then
    mkdir archives
fi

wget -P archives -i list.txt