#!/bin/bash
# Sync changes to both repositories

echo "��� Staging all changes..."
git add .

echo ""
read -p "��� Commit message: " msg

if [ -z "$msg" ]; then
    echo "❌ Commit message required"
    exit 1
fi

echo ""
echo "��� Committing..."
git commit -m "$msg"

echo "��� Pushing to PYTHON-ACHIEVEMENT-2 (EXERCISE-2.5 branch)..."
git push origin EXERCISE-2.5

echo "��� Pushing to recipe-app (main branch)..."
git push recipe-app EXERCISE-2.5:main

echo ""
echo "✅ Synced to both repos!"
