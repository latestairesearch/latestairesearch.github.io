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

if ! grep -Fq 'href="/tutorials/tag/llms/"' "_site/index.html"; then
  echo "FAIL: tutorial tag links should include trailing slashes"
  exit 1
fi

if ! grep -Fq 'href="/tutorials/category/frontier-research/"' "_site/index.html"; then
  echo "FAIL: tutorial category links should include trailing slashes"
  exit 1
fi

echo "PASS: tutorial tag and category archive pages exist"
