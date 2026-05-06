#!/bin/bash

# ----------------------------------------------------------------------------
# LLM.TXT UPDATE BRIDGE
# This script bridges your filesystem (data/) with Typst's metadata engine.
# ----------------------------------------------------------------------------

echo "Starting AI Context Update..."

# 1. SCAN FOR DATA
# We list all JSON files, take only the filenames (basename), 
# and join them with commas for Typst to read.
# Example result: "how-to.json,ai-recipe.json"
FILES=$(ls data/*.json | xargs -n 1 basename | paste -sd "," -)

# 2. RUN TYPST QUERY
# We tell Typst: "Load manifest.typ, give it the list of files, 
# and return the content of the <manifest> label."
# --field value extracts the raw string.
# jq -r '.' cleans up the JSON formatting to give us plain text.
MANIFEST=$(typst query manifest.typ "<manifest>" --input files="$FILES" --field value --one | jq -r '.')

# 3. UPDATE THE DOCS
# We use 'sed' to "clean" the llms.txt file. 
# It finds "## Available Posters" and deletes everything below it.
# Then we append the new list we just generated.
sed -i '/## Available Posters/,$d' llms.txt
echo -e "## Available Posters\n$MANIFEST" >> llms.txt

echo "Alhamdulillah, llms.txt updated via Typst-Native query."
