#!/bin/sh
# Allows Ctrl-c shutdown of runsvdir when Docker is started interactively
# See https://gist.github.com/iansltx/119cae66ab1defa03762

sv_stop() {
    for s in $(ls -d /etc/service/*); do
        sv stop $s
    done
}

trap "sv_stop; exit" SIGTERM
runsvdir -P /etc/service &
wait
