#!/bin/bash

pushd sources
for pkg in `find -maxdepth 1 -type d`; do 
  [ pkg == '.' ] && continue
  pushd $pkg > /dev/null
  # No spec found, skip building
  [ -z `find -maxdepth 1 -name *.spec|head -n1` ] && continue
  echo Updating $pkg
  git pull 
  popd > /dev/null
done
popd 
