#!/bin/bash
# Build the Astro site and deploy it live to Netlify (Flolae fashion blog).

set -euo pipefail

export PATH="$HOME/.local/node/bin:$PATH"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SITE_ID="a7f1f44c-9acb-4d97-8987-8c1015949686"  # gleeful-paletas-bd2e85

echo "Building site..."
( cd "$DIR/site" && rm -rf node_modules/.astro .astro dist && npx astro build )

echo "Deploying to Netlify..."
netlify deploy --prod --dir="$DIR/site/dist" --site="$SITE_ID"

echo "✓ Live: https://gleeful-paletas-bd2e85.netlify.app"
