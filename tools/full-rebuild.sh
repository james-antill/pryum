#! /bin/sh -e

docker="sudo docker"
if [ -x /usr/bin/podman ]; then
    docker="sudo podman"
fi

master=pryum32.conf
oconfigs="32 31"

if [ "x$1" = "x-m" ]; then
    master="$2"
    shift; shift
fi

if [ "x$1" = "x-o" ]; then
    oconfigs="$2"
    shift; shift
fi

builtins="conf/$master"
overwrite=true

for v in $oconfigs; do
    ./tools/rebuild-conf.sh $master $v
done

./tools/rebuild.pl pryum $builtins
if $overwrite; then
    mv pryum.new pryum
fi
