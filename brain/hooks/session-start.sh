#!/bin/bash
# AstroRealm 共脑系统 - 会话启动脚本
# 加载人设 + 偏好 + 知识库 + 会话摘要

# AstroRealm 根目录（自动检测）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASTRO_REALM_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

BRAIN_DIR="$ASTRO_REALM_ROOT/brain"
KNOWLEDGE_DIR="$BRAIN_DIR/knowledge"
MEMORY_DIR="$BRAIN_DIR/memory"
PERSONA_BASE="$MEMORY_DIR/persona/base.md"
PERSONA_PREFS="$MEMORY_DIR/persona/preferences.md"
MOC_FILE="$KNOWLEDGE_DIR/MOC.md"
DAILY_DIR="$KNOWLEDGE_DIR/01-Daily"
CONCEPTS_DIR="$KNOWLEDGE_DIR/03-Concepts"

# 运行时记忆目录
RUNTIME_MEMORY="$HOME/.claude/projects/C--Users-23939/memory"

# 读取基础人设
if [ -f "$PERSONA_BASE" ]; then
    PERSONA_BASE_CONTENT=$(cat "$PERSONA_BASE" | sed 's/\/\\/g' | sed 's/"/\\"/g' | tr '\n' '\n')
else
    PERSONA_BASE_CONTENT="基础人设文件不存在"
fi

# 读取用户偏好
if [ -f "$PERSONA_PREFS" ]; then
    PERSONA_PREFS_CONTENT=$(cat "$PERSONA_PREFS" | sed 's/\/\\/g' | sed 's/"/\\"/g' | tr '\n' '\n')
else
    PERSONA_PREFS_CONTENT="用户偏好文件不存在"
fi

# 读取知识库 MOC
if [ -f "$MOC_FILE" ]; then
    MOC_CONTENT=$(cat "$MOC_FILE" | sed 's/\/\\/g' | sed 's/"/\\"/g' | tr '\n' '\n')
else
    MOC_CONTENT="MOC 文件不存在"
fi

# 读取最近日志（最近2篇）
LATEST_LOGS=$(ls -t "$DAILY_DIR"/*.md 2>/dev/null | head -2)
LOG_CONTENT=""
for log in $LATEST_LOGS; do
    if [ -f "$log" ]; then
        log_name=$(basename "$log" .md)
        log_text=$(cat "$log" | sed 's/\/\\/g' | sed 's/"/\\"/g' | tr '\n' '\n')
        LOG_CONTENT="${LOG_CONTENT}#### ${log_name}\n${log_text}\n\n"
    fi
done
[ -z "$LOG_CONTENT" ] && LOG_CONTENT="暂无日志"

# 读取概念笔记列表
CONCEPTS_LIST=$(ls "$CONCEPTS_DIR"/*.md 2>/dev/null | xargs -I {} basename {} .md | tr '\n' ', ' 2>/dev/null)
[ -z "$CONCEPTS_LIST" ] && CONCEPTS_LIST="暂无"

# 读取上次会话摘要
mkdir -p "$RUNTIME_MEMORY/session_summaries"
LATEST_SUMMARY=$(ls -t "$RUNTIME_MEMORY/session_summaries"/*.md 2>/dev/null | head -1)
SUMMARY_CONTENT=""
if [ -f "$LATEST_SUMMARY" ]; then
    summary_text=$(cat "$LATEST_SUMMARY" | sed 's/\/\\/g' | sed 's/"/\\"/g' | tr '\n' '\n')
    SUMMARY_CONTENT="### 上次会话摘要\n${summary_text}\n\n"
fi

# 读取待处理反馈数量
PENDING_FEEDBACK="$MEMORY_DIR/feedback/pending.md"
PENDING_COUNT=$(grep -c "^### \[" "$PENDING_FEEDBACK" 2>/dev/null || echo "0")

# 输出 JSON
cat << EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"## 🎭 AI 助手人设\n\n### 基础人设\n$PERSONA_BASE_CONTENT\n\n### 用户偏好（动态）\n$PERSONA_PREFS_CONTENT\n\n---\n\n## 📚 知识库状态\n\n### MOC 索引\n$MOC_CONTENT\n\n### 最近日志\n$LOG_CONTENT\n### 概念笔记\n$CONCEPTS_LIST\n\n$SUMMARY_CONTENT---\n\n## 📊 系统状态\n\n- 待处理反馈：${PENDING_COUNT} 条\n- 人设版本：v1.0\n- 系统路径：$ASTRO_REALM_ROOT\n\n💡 提示：使用 /brain 命令进行深度知识检索 | 使用 /feedback 提供反馈"}}
EOF
