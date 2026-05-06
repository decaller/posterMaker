#!/bin/bash

# 1. Collect all JSON files in data/ into a comma-separated string
FILES=$(ls data/*.json | xargs -n 1 basename | paste -sd "," -)

# 2. Use Typst to query the manifest metadata
# We use --field value to get the raw string and jq -r to strip JSON quotes
MANIFEST=$(typst query manifest.typ "<manifest>" --input files="$FILES" --field value --one | jq -r '.')

# 3. Update llms.txt
# We use sed to remove everything from "## Available Posters" onwards and append new content
sed -i '/## Available Posters/,$d' llms.txt
echo -e "## Available Posters\n$MANIFEST" >> llms.txt

echo "Alhamdulillah, llms.txt updated via Typst-Native query."
