#!/usr/bin/env bash

set -euo pipefail

theme_file="_sass/_themes.scss"

check_contains() {
  local needle="$1"

  if ! grep -Fq -- "$needle" "$theme_file"; then
    echo "FAIL: expected palette value '$needle' in $theme_file"
    exit 1
  fi
}

check_contains "--global-theme-color: #b85c38;"
check_contains "--global-hover-color: #8f4023;"
check_contains "--global-highlight-color: #c96a43;"
check_contains "--global-bg-color: #f6f1ea;"
check_contains "--global-theme-color: #f2a65a;"
check_contains "--global-hover-color: #ffbe7a;"
check_contains "--global-bg-color: #1f252b;"

echo "PASS: theme palette matches the custom copper and slate scheme"
