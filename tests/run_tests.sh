#!/bin/bash
set -e

bash ./build_it.sh

bash ./test_meteor_app.sh
bash ./test_meteor_app_with_devbuild.sh

# Disabled by @abernix.  I don't understand how this test is intended to work.
#bash ./test_bundle_local_mount.sh

# Disabled by @abernix.
# I understand how this test works, but it fails and I've chose not to fix it.
# They all use BUNDLE_URL=https://s3.amazonaws.com/zeema-data/aa.tar.gz
# but that bundle won't run under Node 4 until it's repackaged with Meteor 1.4.
# bash ./test_bundle_web.sh
# bash ./test_binary_build_on_base.sh
# bash ./test_binary_build_on_bin_build.sh

bash ./test_phantomjs.sh
bash ./test_no_app.sh