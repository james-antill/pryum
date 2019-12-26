#! /usr/bin/python3 -t

import sys

import dnf


base = dnf.Base()
base.read_all_repos()

for repo in base.repos.get_matching("*updates"):
    repo.disable()
base.fill_sack(load_system_repo='auto')

name = sys.argv[1]
base.install(name)
base.resolve()

num = 0
tot = 0
for pkg in base.transaction.install_set:
    num += 1
    tot += pkg.downloadsize
print("Pkgs:", num)
print("Size:", tot)

urls = []
for pkg in base.transaction.install_set:
    if pkg.name != name:
        continue
    urls.append(pkg.location)
for pkg in base.transaction.install_set:
    if pkg.name == name:
        continue
    urls.append(pkg.location)
print("URLs:", " ".join(urls))
