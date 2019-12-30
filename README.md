Pre-resolved yum/dnf
====================

Mainly for use in containers where we don't have, and don't want, the repo.
metadata. This allows installing packages pre-resovled to release versions,
which is possible because we have a known starting state (the Fedora container)
and we resolve to the release versions (no updates). The configs. currently
have over 200 packages for each OS release.

To Download/Install:

    curl -O https://raw.githubusercontent.com/james-antill/pryum/master/pryum
    chmod +x pryum

To run:

    ./pryum --help
    ./pryum ls zsh strace iotop exa
    ./pryum search z
    ./pryum --os-version=30 in zsh strace

You can copy any of files from conf/* to / or /etc/ however the script comes
with builtin support for the latest supported Fedora release (F31), and will
automatically download the data for F28+.

Feel free to open PRs to add packages to the latest conf/pryum*.conf file.
