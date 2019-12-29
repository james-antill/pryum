#! /bin/sh -e

# We are inside the container, $1 == master config. file. $2 == version.
if [ "x$1" = "x" ]; then
    exit 1
fi
if [ "x$2" = "x" ]; then
    exit 1
fi

. /etc/os-release
if [ "x$2" != "x$VERSION_ID" ]; then
    exit 2
fi

cp -a /mnt/conf/$1 /pryum.conf

sed -i.tmp -e "s/PKGS[0-9]*=(/PKGS$2=(/" /pryum.conf
/mnt/pryum redeps > /mnt/conf/pryum$2.conf.data
