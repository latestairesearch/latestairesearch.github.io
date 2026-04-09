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

check_contains "--global-theme-color: #2f6fec;"
check_contains "--global-hover-color: #1f5ad1;"
check_contains "--global-highlight-color: #4d8dff;"
check_contains "--global-bg-color: #f3f7fc;"
check_contains "--global-card-bg-color: #ffffff;"
check_contains "--global-theme-color: #7db3ff;"
check_contains "--global-hover-color: #a9cbff;"
check_contains "--global-bg-color: #0f1722;"
check_contains "--global-card-bg-color: #162130;"

echo "PASS: theme palette matches the paper blue scheme"
