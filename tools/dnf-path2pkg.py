#! /usr/bin/python3 -t

#  This uses DNF API to resolve a package install on the local system, then
# output what the new packages would be.

import sys

import dnf

if len(sys.argv) < 2:
    print('Usage: dnf-path2pkg /path/to/pkg')
    sys.exit(1)

base = dnf.Base()
base.read_all_repos()

for repo in base.repos.get_matching("*updates"):
    repo.disable()
base.fill_sack(load_system_repo='auto')

human = True

name = sys.argv[1]
if name == '-q':
    human = False
    name = sys.argv[2]

subj = dnf.subject.Subject(name)
q = subj.get_best_query(base.sack, with_nevra=True, with_provides=False,
                        with_filenames=True)
available_pkg_names = []
if q:
    available_pkgs = q.available()
    available_pkg_names = list(available_pkgs._name_dict().keys())
for pkg in sorted(available_pkg_names):
    print(pkg)


