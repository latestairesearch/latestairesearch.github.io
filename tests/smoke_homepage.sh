#!/usr/bin/env bash

set -euo pipefail

site_file="_site/index.html"

if [[ ! -f "$site_file" ]]; then
  echo "FAIL: $site_file does not exist"
  exit 1
fi

if ! grep -q "Latest AI Research" "$site_file"; then
  echo "FAIL: Latest AI Research not found in $site_file"
  exit 1
fi

echo "PASS: homepage contains Latest AI Research"
