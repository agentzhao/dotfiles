#!/bin/bash

exec > /var/log/fix_updates 2>&1

# Upgrade everything that can be safely upgraded
dnf4 update --skip-broken -y
# Collect the remaining duplicate packages for later reinstallation
broken=$(dnf4 check --duplicates | xargs rpm -q --qf '%{NAME}\n' | uniq)
# Remove the ""old"" package, so that the new package can be reinstalled
dnf4 remove --duplicates -y
test -n ""$broken"" && dnf4 reinstall -y $broken"
