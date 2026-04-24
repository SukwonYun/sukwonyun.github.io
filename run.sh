#!/bin/bash

echo "🚀 Starting Hugo development server with live reload..."
echo "📝 Your website will be available at: http://localhost:1313"
echo "✨ Changes will be reflected automatically!"
echo ""

# Check if hugo is installed globally, otherwise use npx
if command -v hugo &> /dev/null; then
    echo "Using globally installed Hugo..."
    hugo server -D --bind=0.0.0.0 --baseURL=http://localhost:1313
else
    echo "Using npx to run Hugo (will download if needed)..."
    npx hugo-bin server -D --bind=0.0.0.0 --baseURL=http://localhost:1313
fi