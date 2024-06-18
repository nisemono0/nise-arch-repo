#!/bin/bash
set -euo pipefail

DB_NAME="nise-arch-repo"

cd ./x86_64

echo "=== Removing old DB ==="
rm -f "$DB_NAME.*" # Remove old db

echo "=== Creating new DB ==="
repo-add -n -R "$DB_NAME.db.tar.gz" *.pkg.tar.zst

echo "=== Removing symlinks and renaming DB ==="
# Remove symlinks since git doesn't like them
rm "$DB_NAME.db"
rm "$DB_NAME.files"

# Rename .tar.gz db files
mv "$DB_NAME.db.tar.gz" "$DB_NAME.db"
mv "$DB_NAME.files.tar.gz" "$DB_NAME.files"

echo "=== Done ! ==="
