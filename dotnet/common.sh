#!/usr/bin/env bash

get_rid() {
  local RID_LINE
  RID_LINE=$(dotnet --info | grep RID || exit 1)
  echo "${RID_LINE##*:}" | xargs
}

get_framework() {
  local MAJOR_VERSION
  MAJOR_VERSION=$(dotnet --version | grep -Eo '[0-9]\.[0-9]+')
  echo "net$MAJOR_VERSION"
}

# Exists for compatibility reasons
get-framework() {
  get_framework
}

# Exists for compatibility reasons
get-rid() {
  get_rid
}
