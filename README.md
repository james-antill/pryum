Pre-resolved yum/dnf
====================

Mainly for use in containers where we don't have, and don't want, the repo.
metadata. This allows installing packages pre-resovled to release versions.

To Download:

    curl -O https://raw.githubusercontent.com/james-antill/pryum/master/pryum

To run:

    chmod +x pryum
    ./pryum.sh in zsh strace iotop

You can copy any of files from conf/* to /pryum.conf or /etc/pryum.conf but
the default script comes with the currently support Fedora data (F30 and F31).

Feel free to open PRs to add packages to the latest conf/pryum*.conf file.
