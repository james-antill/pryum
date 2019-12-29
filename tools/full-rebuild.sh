#! /bin/sh -e

docker="sudo docker"
if [ -x /usr/bin/podman ]; then
    docker="sudo podman"
fi

master=pryum31.conf
oconfigs="31 30 29 28 32"
builtins="conf/pryum30.conf conf/$master"

overwrite=true

for v in $oconfigs; do
    ./tools/rebuild-conf.sh $master $v
done

./tools/rebuild.pl pryum $builtins
if $overwrite; then
    mv pryum.new pryum
fi
