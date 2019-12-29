Pre-resolved yum/dnf
====================

Mainly for use in containers where we don't have, and don't want, the repo.
metadata. This allows installing packages pre-resovled to release versions.

To Download:

    curl -O https://raw.githubusercontent.com/james-antill/pryum/master/pryum

To run:

    chmod +x pryum
    ./pryum ls zsh strace iotop exa
    ./pryum search z
    ./pryum in zsh strace iotop exa

You can copy any of files from conf/* to /pryum.conf or /etc/pryum.conf (or
combine multiple files) however the script comes with support for the currently
supported Fedora releases (F30 and F31) by default.

Feel free to open PRs to add packages to the latest conf/pryum*.conf file.
