#! /bin/sh -e

docker="sudo docker"
if [ -x /usr/bin/podman ]; then
    docker="sudo podman"
fi

master=pryum31.conf
oconfigs="31 30 29 28"
builtins="conf/pryum30.conf conf/$master"

overwrite=true

for v in $oconfigs; do
    echo "Rebuilding conf/pryum$v.conf based on conf/$master"
    $docker run --rm -v $(pwd):/mnt -it fedora:$v /mnt/tools/c-redeps.sh \
        $master $v
    cp -a conf/$master conf/pryum$v.conf.new
    sed -i.tmp -e "s/PKGS[0-9]*=(/PKGS$v=(/" conf/pryum$v.conf.new
    rm -f conf/pryum$v.conf.new.tmp

    ./tools/reconf.pl conf/pryum$v.conf.data conf/pryum$v.conf.new
    mv conf/pryum$v.conf.new.new conf/pryum$v.conf.new
    rm -f conf/pryum$v.conf.data
    if $overwrite; then
        mv conf/pryum$v.conf.new conf/pryum$v.conf
    fi
done

./tools/rebuild.pl pryum $builtins
if $overwrite; then
    mv pryum.new pryum
fi
