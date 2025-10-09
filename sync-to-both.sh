#!/bin/bash
# Sync changes to both repositories

echo "Ì≥¶ Staging all changes..."
git add .

echo ""
read -p "Ì≥ù Commit message: " msg

if [ -z "$msg" ]; then
    echo "‚ùå Commit message required"
    exit 1
fi

echo ""
echo "Ì≤æ Committing..."
git commit -m "$msg"

echo "Ì≥§ Pushing to PYTHON-ACHIEVEMENT-2 (EXERCISE-2.4 branch)..."
git push origin EXERCISE-2.4

echo "Ì≥§ Pushing to recipe-app (main branch)..."
git push recipe-app EXERCISE-2.4:main

echo ""
echo "‚úÖ Synced to both repos!"
