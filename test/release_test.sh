#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

assertCapturedReleaseOutput() {
  # \\\$PORT is required because we'll be putting this into interpolative 
  # quotes (i.e. "") twice. Is there a better way to do this?
  expected_release_output=`cat <<EOF
---
config_vars:
  PATH: /app/mono/bin:/app/xsp/bin:/usr/local/bin:/usr/bin:/bin
default_process_types:
  web: /app/xsp/bin/xsp4 --nonstop --port \\\$PORT --root "$1"
EOF`
  assertCapturedEquals "${expected_release_output}"
}

testRelease() {
  release

  assertCapturedSuccess
  assertCapturedReleaseOutput "."
}

testReleaseWithBin() {
  mkdir ${BUILD_DIR}/bin

  release

  assertCapturedSuccess
  assertCapturedReleaseOutput "."
}

testReleaseWithBinFile() {
  touch ${BUILD_DIR}/bin

  release  

  assertCapturedSuccess
  assertCapturedReleaseOutput "."
}

testReleaseWithSolution() {
  mkdir ${BUILD_DIR}/MySolution
  touch ${BUILD_DIR}/MySolution.sln

  release  

  assertCapturedSuccess
  assertCapturedReleaseOutput "/app/MySolution"
}

testReleaseWithSolutionCaseInsensitivity() {
  mkdir ${BUILD_DIR}/MySolution
  touch ${BUILD_DIR}/MySolution.SLN

  release  

  assertCapturedSuccess
  assertCapturedReleaseOutput "/app/MySolution"
}

testReleaseWithSolutionButNoProjectDir() {
  touch ${BUILD_DIR}/MySolution.sln

  release  

  assertCapturedSuccess
  assertCapturedReleaseOutput "."
}
