#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect() {
  touch ${BUILD_DIR}/global.asax
  
  detect

  assertAppDetected "ASP.NET"
}

testDetectIsNotCaseSensitive() {
  touch ${BUILD_DIR}/Global.asax
  
  detect

  assertAppDetected "ASP.NET"
}

testDetectGlobalAsaxFileIsNotInRoot() {
  mkdir -p ${BUILD_DIR}/WebProject
  touch ${BUILD_DIR}/WebProject/Global.asax
  
  detect

  assertAppDetected "ASP.NET"
}

testNoDetect() {
  detect

  assertNoAppDetected
}

testNoDetectMissingGlobalAsaxFile() {
  touch ${BUILD_DIR}/build.xml

  detect

  assertNoAppDetected
}

testNoDetectGlobalAsaxFileNestedTooDeep() {
  mkdir -p ${BUILD_DIR}/WebProject/TooFar
  touch ${BUILD_DIR}/WebProject/TooFar/build.xml

  detect

  assertNoAppDetected
}
