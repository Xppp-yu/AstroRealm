#!/bin/bash
# 动态记忆系统 - 会话结束脚本
# 生成摘要 + 检查是否需要迭代

PROJECT_DIR="E:/ClaudeStudio/projects/memory-system"
MEMORY_DIR="C:/Users/23939/.claude/projects/C--Users-23939/memory"
DATE=$(date +%Y-%m-%d)

# 检查是否有待处理反馈
PENDING_COUNT=$(grep -c "^### \[" "$PROJECT_DIR/feedback/pending.md" 2>/dev/null || echo "0")

# 如果有待处理反馈，提示用户
if [ "$PENDING_COUNT" -gt 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📊 系统提示"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "您有 ${PENDING_COUNT} 条待处理的反馈。"
    echo "运行以下命令来处理："
    echo ""
    echo "  ./hooks/iterate.sh"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi

# 创建会话摘要目录
mkdir -p "$MEMORY_DIR/session_summaries"

# 输出提示（实际摘要由 Claude Code 的 Stop Hook 处理）
echo "会话摘要已保存。"
