#!/usr/bin/env bash

get-framework() {
  local MAJOR_VERSION
  MAJOR_VERSION=$(dotnet --version | grep -Eo '[0-9]\.[0-9]+')
  echo "net$MAJOR_VERSION"
}

get-rid() {
  local RID_LINE
  RID_LINE=$(dotnet --info | grep RID || exit 1)
  echo "${RID_LINE##*:}" | xargs
  
}
