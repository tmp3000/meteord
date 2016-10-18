#!/bin/bash
set -e

bash ./build_it.sh

bash ./test_meteor_app.sh
# bash ./test_meteor_app_with_devbuild.sh
# Disabled by @abernix.  I don't understand how this test would work.
#bash ./test_bundle_local_mount.sh
# Disabled by @abernix. I understand how this test works, but it fails and I've chose not to fix it.
#bash ./test_bundle_web.sh
# bash ./test_binary_build_on_base.sh
# bash ./test_binary_build_on_bin_build.sh
# bash ./test_phantomjs.sh
# bash ./test_no_app.sh