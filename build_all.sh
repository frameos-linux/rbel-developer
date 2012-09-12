#!/bin/bash
#
# Send all the packages to the target buildbot (PKGWIZ_BUILDBOT)
#
# export PKGWIZ_BUILDBOT=host-address-here
# export PKGWIZ_PROFILE=rbel6-x86_64
#

if [ -z $PKGWIZ_BUILDBOT ]; then
  echo export PKGWIZ_BUILDBOT environment variable first.
  exit 1
fi

if [ -z $PKGWIZ_PROFILE ]; then
  echo export PKGWIZ_BUILDBOT environment variable first.
  exit 1
fi

pushd sources 
for pkg in `find -maxdepth 1 -type d`; do 
  [ pkg == '.' ] && continue
  pushd $pkg
  # No spec found, skip building
  [ -z `find -maxdepth 1 -name *.spec|head -n1` ] && continue
  spectool -g -S *.spec
  pkgwiz remote-build -b $PKGWIZ_BUILDBOT -m $PKGWIZ_PROFILE
  popd
done
popd sources 
