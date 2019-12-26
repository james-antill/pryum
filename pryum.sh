#! /bin/bash -e

PKGS=(
        "cowsay:Packages/c/cowsay-3.04-13.fc31.noarch.rpm Packages/p/perl-podlators-4.12-2.fc31.noarch.rpm Packages/p/perl-PathTools-3.78-439.fc31.x86_64.rpm Packages/p/perl-URI-1.76-5.fc31.noarch.rpm Packages/p/perl-Term-ANSIColor-4.06-440.fc31.noarch.rpm Packages/p/perl-Term-Cap-1.17-439.fc31.noarch.rpm Packages/p/perl-Text-ParseWords-3.30-439.fc31.noarch.rpm Packages/p/perl-Data-Dumper-2.174-440.fc31.x86_64.rpm Packages/p/perl-Encode-3.01-439.fc31.x86_64.rpm Packages/p/perl-File-Path-2.16-439.fc31.noarch.rpm Packages/p/perl-threads-2.22-439.fc31.x86_64.rpm Packages/p/perl-threads-shared-1.60-440.fc31.x86_64.rpm Packages/p/perl-Storable-3.15-441.fc31.x86_64.rpm Packages/p/perl-Text-Tabs+Wrap-2013.0523-439.fc31.noarch.rpm Packages/p/perl-HTTP-Tiny-0.076-439.fc31.noarch.rpm Packages/p/perl-Unicode-Normalize-1.26-439.fc31.x86_64.rpm Packages/p/perl-Errno-1.30-446.fc31.x86_64.rpm Packages/p/perl-File-Temp-0.230.900-439.fc31.noarch.rpm Packages/p/perl-Carp-1.50-439.fc31.noarch.rpm Packages/p/perl-IO-1.40-446.fc31.x86_64.rpm Packages/p/perl-Exporter-5.73-440.fc31.noarch.rpm Packages/p/perl-MIME-Base64-3.15-439.fc31.x86_64.rpm Packages/p/perl-constant-1.33-440.fc31.noarch.rpm Packages/p/perl-Digest-1.17-439.fc31.noarch.rpm Packages/p/perl-Time-Local-1.280-439.fc31.noarch.rpm Packages/p/perl-Pod-Escapes-1.07-439.fc31.noarch.rpm Packages/p/perl-Digest-MD5-2.55-439.fc31.x86_64.rpm Packages/p/perl-Pod-Perldoc-3.28.01-442.fc31.noarch.rpm Packages/p/perl-Net-SSLeay-1.88-3.fc31.x86_64.rpm Packages/p/perl-Pod-Simple-3.39-2.fc31.noarch.rpm Packages/p/perl-Scalar-List-Utils-1.52-439.fc31.x86_64.rpm Packages/p/perl-IO-Socket-IP-0.39-440.fc31.noarch.rpm Packages/p/perl-interpreter-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-IO-Socket-SSL-2.066-6.fc31.noarch.rpm Packages/g/groff-base-1.22.3-20.fc31.x86_64.rpm Packages/p/perl-Pod-Usage-1.69-439.fc31.noarch.rpm Packages/p/perl-libnet-3.11-440.fc31.noarch.rpm Packages/p/perl-libs-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-macros-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-Getopt-Long-2.51-1.fc31.noarch.rpm Packages/p/perl-Mozilla-CA-20180117-6.fc31.noarch.rpm Packages/p/perl-parent-0.237-439.fc31.noarch.rpm Packages/p/perl-Socket-2.029-4.fc31.x86_64.rpm"

        # Utils...
        "diffutils:Packages/d/diffutils-3.7-3.fc31.x86_64.rpm"
        "dnf-utils:Packages/d/dnf-utils-4.0.9-1.fc31.noarch.rpm Packages/p/python3-dnf-plugins-core-4.0.9-1.fc31.noarch.rpm Packages/p/python3-distro-1.4.0-2.fc31.noarch.rpm Packages/p/python3-setuptools-41.2.0-1.fc31.noarch.rpm Packages/p/python3-six-1.12.0-2.fc31.noarch.rpm Packages/d/dnf-plugins-core-4.0.9-1.fc31.noarch.rpm Packages/p/python3-dateutil-2.8.0-3.fc31.noarch.rpm"
        "fzf:Packages/f/fzf-0.18.0-3.fc31.x86_64.rpm"
        "iftop:Packages/i/iftop-1.0-0.21.pre4.fc31.x86_64.rpm"
        "iotop:Packages/i/iotop-0.6-20.fc31.noarch.rpm"
        "jq:Packages/j/jq-1.6-3.fc31.x86_64.rpm Packages/o/oniguruma-6.9.3-1.fc31.x86_64.rpm"
        "less:Packages/l/less-551-2.fc31.x86_64.rpm"
        "ltrace:Packages/l/ltrace-0.7.91-35.fc31.x86_64.rpm"
        "mc:Packages/m/mc-4.8.23-1.fc31.x86_64.rpm Packages/p/perl-Socket-2.029-4.fc31.x86_64.rpm Packages/g/gpm-libs-1.20.7-19.fc31.x86_64.rpm Packages/p/perl-PathTools-3.78-439.fc31.x86_64.rpm Packages/p/python2-2.7.16-4.fc31.x86_64.rpm Packages/p/perl-File-Path-2.16-439.fc31.noarch.rpm Packages/l/libxcrypt-compat-4.4.10-1.fc31.x86_64.rpm Packages/p/perl-threads-2.22-439.fc31.x86_64.rpm Packages/p/perl-threads-shared-1.60-440.fc31.x86_64.rpm Packages/p/perl-Unicode-Normalize-1.26-439.fc31.x86_64.rpm Packages/p/perl-Text-Tabs+Wrap-2013.0523-439.fc31.noarch.rpm Packages/g/gdbm-1.18.1-1.fc31.x86_64.rpm Packages/p/perl-Errno-1.30-446.fc31.x86_64.rpm Packages/p/python2-setuptools-41.2.0-1.fc31.noarch.rpm Packages/p/perl-File-Temp-0.230.900-439.fc31.noarch.rpm Packages/p/perl-Carp-1.50-439.fc31.noarch.rpm Packages/p/python2-pip-19.1.1-4.fc31.noarch.rpm Packages/p/perl-IO-1.40-446.fc31.x86_64.rpm Packages/p/perl-Exporter-5.73-440.fc31.noarch.rpm Packages/p/perl-constant-1.33-440.fc31.noarch.rpm Packages/l/libssh2-1.9.0-2.fc31.x86_64.rpm Packages/s/slang-2.3.2-6.fc31.x86_64.rpm Packages/p/perl-interpreter-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-Scalar-List-Utils-1.52-439.fc31.x86_64.rpm Packages/p/python2-libs-2.7.16-4.fc31.x86_64.rpm Packages/p/perl-libs-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-macros-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-parent-0.237-439.fc31.noarch.rpm"
         "moreutils:Packages/m/moreutils-0.57-11.fc31.x86_64.rpm Packages/p/perl-podlators-4.12-2.fc31.noarch.rpm Packages/p/perl-PathTools-3.78-439.fc31.x86_64.rpm Packages/p/perl-URI-1.76-5.fc31.noarch.rpm Packages/p/perl-Term-ANSIColor-4.06-440.fc31.noarch.rpm Packages/p/perl-Term-Cap-1.17-439.fc31.noarch.rpm Packages/p/perl-Text-ParseWords-3.30-439.fc31.noarch.rpm Packages/p/perl-Data-Dumper-2.174-440.fc31.x86_64.rpm Packages/p/perl-Encode-3.01-439.fc31.x86_64.rpm Packages/p/perl-File-Path-2.16-439.fc31.noarch.rpm Packages/p/perl-threads-2.22-439.fc31.x86_64.rpm Packages/p/perl-threads-shared-1.60-440.fc31.x86_64.rpm Packages/p/perl-Storable-3.15-441.fc31.x86_64.rpm Packages/p/perl-Text-Tabs+Wrap-2013.0523-439.fc31.noarch.rpm Packages/p/perl-HTTP-Tiny-0.076-439.fc31.noarch.rpm Packages/p/perl-Unicode-Normalize-1.26-439.fc31.x86_64.rpm Packages/p/perl-Errno-1.30-446.fc31.x86_64.rpm Packages/p/perl-File-Temp-0.230.900-439.fc31.noarch.rpm Packages/p/perl-Carp-1.50-439.fc31.noarch.rpm Packages/p/perl-IO-1.40-446.fc31.x86_64.rpm Packages/p/perl-Exporter-5.73-440.fc31.noarch.rpm Packages/p/perl-MIME-Base64-3.15-439.fc31.x86_64.rpm Packages/p/perl-constant-1.33-440.fc31.noarch.rpm Packages/p/perl-Time-Duration-1.21-3.fc31.noarch.rpm Packages/p/perl-Digest-1.17-439.fc31.noarch.rpm Packages/p/perl-Time-HiRes-1.9760-439.fc31.x86_64.rpm Packages/p/perl-Time-Local-1.280-439.fc31.noarch.rpm Packages/p/perl-Pod-Escapes-1.07-439.fc31.noarch.rpm Packages/p/perl-Digest-MD5-2.55-439.fc31.x86_64.rpm Packages/p/perl-Pod-Perldoc-3.28.01-442.fc31.noarch.rpm Packages/p/perl-Net-SSLeay-1.88-3.fc31.x86_64.rpm Packages/p/perl-TimeDate-2.30-18.fc31.noarch.rpm Packages/p/perl-Pod-Simple-3.39-2.fc31.noarch.rpm Packages/p/perl-Scalar-List-Utils-1.52-439.fc31.x86_64.rpm Packages/p/perl-IO-Socket-IP-0.39-440.fc31.noarch.rpm Packages/p/perl-interpreter-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-IO-Socket-SSL-2.066-6.fc31.noarch.rpm Packages/g/groff-base-1.22.3-20.fc31.x86_64.rpm Packages/p/perl-Pod-Usage-1.69-439.fc31.noarch.rpm Packages/p/perl-libnet-3.11-440.fc31.noarch.rpm Packages/p/perl-IO-Tty-1.12-16.fc31.x86_64.rpm Packages/p/perl-libs-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-IPC-Run-20180523.0-6.fc31.noarch.rpm Packages/p/perl-macros-5.30.0-446.fc31.x86_64.rpm Packages/p/perl-Getopt-Long-2.51-1.fc31.noarch.rpm Packages/p/perl-Mozilla-CA-20180117-6.fc31.noarch.rpm Packages/p/perl-parent-0.237-439.fc31.noarch.rpm Packages/p/perl-Socket-2.029-4.fc31.x86_64.rpm"
        "openssh:Packages/o/openssh-8.0p1-8.fc31.1.x86_64.rpm Packages/f/fipscheck-lib-1.5.0-7.fc31.x86_64.rpm Packages/f/fipscheck-1.5.0-7.fc31.x86_64.rpm"
        "procps-ng:Packages/p/procps-ng-3.3.15-6.fc31.x86_64.rpm"
        "/usr/bin/ps:Packages/p/procps-ng-3.3.15-6.fc31.x86_64.rpm"
        "/usr/bin/top:Packages/p/procps-ng-3.3.15-6.fc31.x86_64.rpm"
        "python:Packages/p/python-unversioned-command-3.7.4-5.fc31.noarch.rpm"
        "strace:Packages/s/strace-5.3-1.fc31.x86_64.rpm"

        # Shells...
        "fish:Packages/f/fish-3.0.2-1.module_f31+3716+57207597.x86_64.rpm Packages/l/less-551-2.fc31.x86_64.rpm Packages/p/pkgconf-1.6.3-2.fc31.x86_64.rpm Packages/p/pkgconf-m4-1.6.3-2.fc31.noarch.rpm Packages/p/pkgconf-pkg-config-1.6.3-2.fc31.x86_64.rpm Packages/l/libpipeline-1.5.1-3.fc31.x86_64.rpm Packages/l/libpkgconf-1.6.3-2.fc31.x86_64.rpm Packages/m/man-db-2.8.4-5.fc31.x86_64.rpm Packages/m/man-pages-5.02-1.fc31.noarch.rpm Packages/p/pcre2-utf32-10.33-14.fc31.x86_64.rpm Packages/g/groff-base-1.22.3-20.fc31.x86_64.rpm"
        "zsh:Packages/z/zsh-5.7.1-4.fc31.x86_64.rpm"

        # Editors...
        "e3:Packages/e/e3-2.82-8.fc31.x86_64.rpm"
        "ed:Packages/e/ed-1.14.2-7.fc31.x86_64.rpm Packages/i/info-6.6-2.fc31.x86_64.rpm"
        "jed:Packages/j/jed-0.99.19-18.fc31.x86_64.rpm Packages/l/libpng-1.6.37-2.fc31.x86_64.rpm Packages/s/slang-2.3.2-6.fc31.x86_64.rpm Packages/s/slang-slsh-2.3.2-6.fc31.x86_64.rpm Packages/o/oniguruma-6.9.3-1.fc31.x86_64.rpm"
        "joe:Packages/j/joe-4.6-6.fc31.x86_64.rpm"
        "nano:Packages/n/nano-4.3-2.fc31.x86_64.rpm"
        "mined:Packages/m/mined-2015.25-7.fc31.x86_64.rpm"
        "vim:Packages/g/gpm-libs-1.20.7-19.fc31.x86_64.rpm Packages/v/vim-common-8.1.2102-1.fc31.x86_64.rpm Packages/v/vim-enhanced-8.1.2102-1.fc31.x86_64.rpm Packages/v/vim-filesystem-8.1.2102-1.fc31.noarch.rpm Packages/w/which-2.21-15.fc31.x86_64.rpm"
        "vim-enhanced:Packages/v/vim-enhanced-8.1.2102-1.fc31.x86_64.rpm Packages/g/gpm-libs-1.20.7-19.fc31.x86_64.rpm Packages/v/vim-common-8.1.2102-1.fc31.x86_64.rpm Packages/v/vim-filesystem-8.1.2102-1.fc31.noarch.rpm Packages/w/which-2.21-15.fc31.x86_64.rpm"
        "vis:Packages/v/vis-0.5-3.fc31.x86_64.rpm Packages/l/lua-lpeg-1.0.1-11.fc31.x86_64.rpm Packages/u/unibilium-2.0.0-5.fc31.x86_64.rpm Packages/t/tre-0.8.0-26.20140228gitc2f5d13.fc31.x86_64.rpm Packages/t/tre-common-0.8.0-26.20140228gitc2f5d13.fc31.noarch.rpm Packages/l/libtermkey-0.20-7.fc31.x86_64.rpm"
        "zile:Packages/z/zile-2.4.14-4.fc31.x86_64.rpm Packages/g/gc-7.6.4-6.fc31.x86_64.rpm Packages/l/libatomic_ops-7.6.10-2.fc31.x86_64.rpm"

        # Hex Editors...
        "dhex:Packages/d/dhex-0.69-2.fc31.x86_64.rpm"
        "hexedit:Packages/h/hexedit-1.2.13-16.fc31.x86_64.rpm"
        "hexer:Packages/h/hexer-1.0.3-3.fc31.x86_64.rpm"
        "shed:Packages/s/shed-1.15-21.fc31.x86_64.rpm"
        "tweak:Packages/t/tweak-3.02-9.fc31.x86_64.rpm"

        "git-core:Packages/g/git-core-2.23.0-1.fc31.x86_64.rpm Packages/f/fipscheck-lib-1.5.0-7.fc31.x86_64.rpm Packages/l/less-551-2.fc31.x86_64.rpm Packages/o/openssh-8.0p1-8.fc31.1.x86_64.rpm Packages/o/openssh-clients-8.0p1-8.fc31.1.x86_64.rpm Packages/l/libedit-3.1-28.20190324cvs.fc31.x86_64.rpm Packages/f/fipscheck-1.5.0-7.fc31.x86_64.rpm"

)

fedpkg="https://download.fedoraproject.org/"

for i in /etc/cyum.conf /cyum.conf; do
  if [ -f $i ]; then
    source $i
    break
  fi
done

cmd="$1"
if [ "x$1" = "x" ]; then
 cmd=ls
fi

case "$cmd" in
 install | in)

# mhost="$(curl -s --head $fedpkg | fgrep location | | awk '{ print $2 }')"
mhost="$(curl -s --head $fedpkg | sed -ne 's/location: \(.*\)$/\1/p')"
off="releases/31/Everything/x86_64/os"

# echo $mhost

for pkg in "${PKGS[@]}" ; do
    NAME=${pkg%%:*}
    URLs=${pkg#*:}
    if [ "x$2" != "x$NAME" ]; then
        continue
    fi
    echo "$NAME =>"
    echo -n "dnf --disablerepo='*' in"
    for URL in $URLs ; do
        echo " \\"
        echo -n "$mhost$off/$URL"
    done
    echo ''
done
# echo -e "${PKGS[1]%%:*} => ${PKGS[1]#*:}\n"
 ;;

 list | ls)

for pkg in "${PKGS[@]}" ; do
    NAME=${pkg%%:*}
    URL=${pkg#*:}
    printf "%s => %s.\n" "$NAME" "$URL"
done
  ;;
esac

exit 0




