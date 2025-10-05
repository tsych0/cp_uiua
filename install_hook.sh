#!/bin/bash
HOOK_TYPE="${1:-pre-commit}"
HOOK_PATH=".git/hooks/$HOOK_TYPE"

echo "🔧 Installing Notion sync as $HOOK_TYPE hook..."

cat > "$HOOK_PATH" << 'EOF'
#!/bin/bash
python3 sync_notion_hook.py
exit 0
EOF

chmod +x "$HOOK_PATH"
echo "✅ Hook installed at $HOOK_PATH"
