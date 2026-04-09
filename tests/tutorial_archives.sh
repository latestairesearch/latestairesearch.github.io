#!/usr/bin/env bash

set -euo pipefail

check_file() {
  local file="$1"

  if [[ ! -f "$file" ]]; then
    echo "FAIL: missing archive page $file"
    exit 1
  fi
}

check_file "_site/tutorials/tag/llms/index.html"
check_file "_site/tutorials/category/frontier-research/index.html"

echo "PASS: tutorial tag and category archive pages exist"
