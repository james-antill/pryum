Pre-resolved yum/dnf
====================

Mainly for use in containers where we don't have, and don't want, the repo.
metadata. This allows installing packages pre-resovled to release versions.

To Download/Install:

    curl -O https://raw.githubusercontent.com/james-antill/pryum/master/pryum
    chmod +x pryum

To run:

    ./pryum ls zsh strace iotop exa
    ./pryum search z
    ./pryum in zsh strace iotop exa

You can copy any of files from conf/* to /pryum.conf or /etc/pryum.conf (or
combine multiple files) however the script comes with builtin support for the
latest supported Fedora release (F31) by default, and will automatically
download the data for F28+.

Feel free to open PRs to add packages to the latest conf/pryum*.conf file.
