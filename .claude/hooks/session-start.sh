#!/bin/bash
set -euo pipefail

# SessionStart hook for Claude Code on the web
# Installs Python dependencies and ensures the project is ready for development

# Only run in remote environment
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR" || exit 1

# Install dependencies using uv
# --extra test includes test dependencies (pytest, pytest-cov)
echo "Installing Python dependencies..."
uv sync --extra test

echo "✅ Project dependencies installed successfully"
