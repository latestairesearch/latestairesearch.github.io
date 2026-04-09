#!/usr/bin/env bash

set -euo pipefail

workflow=".github/workflows/pages.yml"

if [[ ! -f "$workflow" ]]; then
  echo "FAIL: missing $workflow"
  exit 1
fi

grep -Fq 'actions/configure-pages' "$workflow" || {
  echo "FAIL: missing configure-pages step"
  exit 1
}

grep -Fq 'bundle exec jekyll build' "$workflow" || {
  echo "FAIL: missing jekyll build step"
  exit 1
}

grep -Fq 'actions/deploy-pages' "$workflow" || {
  echo "FAIL: missing deploy-pages step"
  exit 1
}

echo "PASS: pages workflow exists and contains required steps"
