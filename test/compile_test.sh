#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  compile
  
  assertCapturedSuccess

  assertCaptured "Bundling Mono v"
  assertCaptured "Fetching Mono v"
  assertTrue "mono should be present in cache" "[ -d ${CACHE_DIR}/mono ]"
  assertTrue "mono should be present in build" "[ -d ${BUILD_DIR}/mono ]"
  assertTrue "mono should be executable" "[ -x ${BUILD_DIR}/mono/bin/mono ]"

  assertCaptured "Bundling XSP v"
  assertCaptured "Fetching XSP v"
  assertTrue "xsp should be present in cache" "[ -d ${CACHE_DIR}/xsp ]"
  assertTrue "xsp should be present in build" "[ -d ${BUILD_DIR}/xsp ]"
  assertTrue "xsp should be executable" "[ -x ${BUILD_DIR}/xsp/bin/xsp4 ]"

  assertTrue "xsp libraries should be in GAC" "[ -d ${CACHE_DIR}/mono/lib/mono/gac/Mono.WebServer2 ]"
  
  assertCaptured "Build SUCCESS"

  # store binaries so we can run the remaining tests more quickly
  TEMP=$(mktemp -d /tmp/mono-binaries-XXXXXXX)
  if [ ! -d "${TEMP}/mono" ]; then cp -r ${CACHE_DIR}/mono ${TEMP}/; fi
  if [ ! -d "${TEMP}/xsp"  ]; then cp -r ${CACHE_DIR}/xsp  ${TEMP}/; fi
}

testCompileCache() {
  # simulate a primed cache
  useCachedOutput

  compile

  assertNotCaptured "Fetching Mono v"
  assertNotCaptured "Fetching XSP v"
}

testCompileTriedXbuild() {
  useCachedOutput

  touch ${BUILD_DIR}/solution.sln

  compile

  # this will fail because .sln is nothing and xbuild is not available, but at 
  # least we know it started
  assertCaptured "Compiling Mono application"
}

testCompileFailureOnMultipleSolutions() {
  useCachedOutput

  touch ${BUILD_DIR}/solution1.sln
  touch ${BUILD_DIR}/solution2.sln

  compile

  assertCapturedError "Too many *.sln files"
}

# use the cached output created by `testCompile`
useCachedOutput() {
  ln -s ${TEMP}/mono ${CACHE_DIR}/mono
  ln -s ${TEMP}/xsp  ${CACHE_DIR}/xsp
}
