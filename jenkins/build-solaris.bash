#!/bin/bash
set -euo pipefail

# Copyright (C) 2017 The Syncthing Authors.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

# This script should be run by Jenkins as './src/github.com/syncthing/syncthing/jenkins/build-macos.bash',
# that is, it should be run from $GOPATH.

. src/github.com/syncthing/syncthing/jenkins/common.bash

init

# after init we are in the source directory

clean
fetchExtra
build
test

go run build.go tar
mv *.tar.gz "$WORKSPACE"
echo