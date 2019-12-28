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

limit = 20 * 1024 * 1024 # 20MB
human = True

name = sys.argv[1]
if name == '-q':
    human = False
    name = sys.argv[2]

base.install(name)
base.resolve()

num = 0
tot = 0
for pkg in base.transaction.install_set:
    num += 1
    tot += pkg.downloadsize


urls = []
for pkg in sorted(base.transaction.install_set):
    if pkg.name != name:
        continue
    urls.append(pkg.location)
for pkg in sorted(base.transaction.install_set):
    if pkg.name == name:
        continue
    urls.append(pkg.location)
if not human:
    if tot > limit:
        sys.exit(1)
    print('        "%s:%s"' % (name, " ".join(urls)))
    sys.exit(0)

print("Pkgs:", num)
print("Size:", tot)
print("URLs:", " ".join(urls))

