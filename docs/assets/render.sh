#!/usr/bin/env bash
# Re-render the plan diagrams from the .mmd sources to SVG + high-res PNG.
# Requires: Node + the Chromium runtime libs (libnss3 libnspr4 libasound2t64).
#   sudo apt-get install -y libnss3 libnspr4 libasound2t64
set -euo pipefail
cd "$(dirname "$0")"

for d in two-planes topology dependencies; do
  npx -y @mermaid-js/mermaid-cli@latest -i "$d.mmd" -o "$d.svg" -p puppeteer-config.json -b transparent
  npx -y @mermaid-js/mermaid-cli@latest -i "$d.mmd" -o "$d.png" -p puppeteer-config.json -b white -s 3
done
echo "Done: SVG (transparent) + PNG (3x, white) for two-planes, topology, dependencies."
