#! /usr/bin/python3 -t

#  This uses DNF API to resolve a package install on the local system, then
# output what the new packages would be.

import sys

import dnf

if len(sys.argv) < 2:
    print('Usage: dnf-resolve pkg-name')
    sys.exit(1)

base = dnf.Base()
base.read_all_repos()

for repo in base.repos.get_matching("*updates"):
    repo.disable()
base.fill_sack(load_system_repo='auto')

limit = 30 * 1024 * 1024 # 20MB
human = True

name = sys.argv[1]
if name == '-q':
    human = False
    name = sys.argv[2]

def _err(*args):
    sys.stderr.write(*args)
_errv = _err
if not sys.stderr.isatty():
    def _errv(*args):
        pass

# https://stackoverflow.com/questions/3154460/python-human-readable-large-numbers
import math
millnames = [' B',' KB',' MB',' GB',' TB']
def shortB(n):
    n = float(n)
    millidx = max(0,min(len(millnames)-1,
                        int(math.floor(0 if n == 0 else math.log10(abs(n))/3))))

    return '{:.0f}{}'.format(n / 10**(3 * millidx), millnames[millidx])


try:
    base.install(name)
except dnf.exceptions.PackageNotFoundError as e:
    _err('* Error: ')
    _err(str(e))
    _err('\n')
    sys.exit(1)
base.resolve()

num = 0
tot = 0
for pkg in base.transaction.install_set:
    num += 1
    tot += pkg.downloadsize

compress_map = {'fedora' : 'f', 'fedora-modular' : 'f-m', 'rawhide' : 'r'}
# All packages URLs are from two parts that look like:
# baseurl (mod/non-mod) ...
# http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/
# http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Modular/$basearch/os/
# Packages (mod/non-mod) ...
# Packages/e/exa-0.9.0-2.module_f31+5365+04413d87.x86_64.rpm
# Packages/l/libssh2-1.9.0-2.fc31.x86_64.rpm
urls = []
for pkg in sorted(base.transaction.install_set):
    # print("JDBG:", pkg.name, pkg.repo.id)
    if pkg.name != name:
        continue
    loc = pkg.location
    loc = loc[len("Packages"):]
    loc = compress_map.get(pkg.repo.id, pkg.repo.id) + loc
    urls.append(loc)
for pkg in sorted(base.transaction.install_set):
    if pkg.name == name:
        continue
    loc = pkg.location
    loc = loc[len("Packages"):]
    loc = compress_map.get(pkg.repo.id, pkg.repo.id) + loc
    urls.append(loc)
if not human:
    if tot > limit:
        _errv(' Filtered: %s (%d pkg(s), %s)\n' % (name, num, shortB(tot)))
        sys.exit(1)
    _errv('  Resolved: %s (%d pkg(s), %s)\n' % (name, num, shortB(tot)))
    print('        "%s:%s"' % (name, " ".join(urls)))
    sys.exit(0)

print("Pkgs:", num)
print("Size:", tot)
print("URLs:", " ".join(urls))

