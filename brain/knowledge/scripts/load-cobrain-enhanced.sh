#!/bin/bash
# CoBrain Enhanced SessionStart Hook
# 加载知识库状态 + 人设文件 + 最近会话摘要

COBRAIN_DIR="/e/CoBrain"
MEMORY_DIR="/c/Users/23939/.claude/projects/C--Users-23939/memory"
MOC_FILE="$COBRAIN_DIR/MOC.md"
DAILY_DIR="$COBRAIN_DIR/01-Daily"
CONCEPTS_DIR="$COBRAIN_DIR/03-Concepts"
PROJECTS_DIR="$COBRAIN_DIR/02-Projects"
DECISIONS_DIR="$COBRAIN_DIR/05-Decisions"
PERSONA_FILE="$MEMORY_DIR/agent_persona.md"
SUMMARY_DIR="$MEMORY_DIR/session_summaries"

# 读取 MOC
if [ -f "$MOC_FILE" ]; then
    MOC_CONTENT=$(cat "$MOC_FILE" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | tr '\n' '\\n')
else
    MOC_CONTENT="MOC 文件不存在"
fi

# 读取最新日志（最近2篇）
LATEST_LOGS=$(ls -t "$DAILY_DIR"/*.md 2>/dev/null | head -2)
LOG_CONTENT=""
for log in $LATEST_LOGS; do
    if [ -f "$log" ]; then
        log_name=$(basename "$log" .md)
        log_text=$(cat "$log" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | tr '\n' '\\n')
        LOG_CONTENT="${LOG_CONTENT}#### ${log_name}\\n${log_text}\\n\\n"
    fi
done
[ -z "$LOG_CONTENT" ] && LOG_CONTENT="暂无日志"

# 读取概念笔记列表
CONCEPTS_LIST=$(ls "$CONCEPTS_DIR"/*.md 2>/dev/null | xargs -I {} basename {} .md | tr '\n' ', ')
[ -z "$CONCEPTS_LIST" ] && CONCEPTS_LIST="暂无"

# 读取决策记录列表
DECISIONS_LIST=$(ls "$DECISIONS_DIR"/*.md 2>/dev/null | xargs -I {} basename {} .md | tr '\n' ', ')
[ -z "$DECISIONS_LIST" ] && DECISIONS_LIST="暂无"

# 读取项目列表
PROJECTS_LIST=$(ls "$PROJECTS_DIR"/*.md 2>/dev/null | xargs -I {} basename {} .md | tr '\n' ', ')
[ -z "$PROJECTS_LIST" ] && PROJECTS_LIST="暂无"

# 读取人设文件
if [ -f "$PERSONA_FILE" ]; then
    # 提取人设关键内容（去掉 frontmatter）
    PERSONA_CONTENT=$(sed '/^---$/,/^---$/d' "$PERSONA_FILE" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | tr '\n' '\\n')
else
    PERSONA_CONTENT="人设文件不存在"
fi

# 读取最近会话摘要
LATEST_SUMMARY=$(ls -t "$SUMMARY_DIR"/*.md 2>/dev/null | head -1)
SUMMARY_CONTENT=""
if [ -f "$LATEST_SUMMARY" ]; then
    summary_text=$(cat "$LATEST_SUMMARY" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | tr '\n' '\\n')
    SUMMARY_CONTENT="### 上次会话摘要\\n${summary_text}\\n\\n"
fi

# 输出 JSON
cat << EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"## AI 助手人设\\n\\n$PERSONA_CONTENT\\n\\n---\\n\\n## CoBrain 知识库状态\\n\\n### MOC 索引\\n$MOC_CONTENT\\n\\n### 最近日志\\n$LOG_CONTENT\\n### 概念笔记\\n$CONCEPTS_LIST\\n\\n### 决策记录\\n$DECISIONS_LIST\\n\\n### 项目列表\\n$PROJECTS_LIST\\n\\n$SUMMARY_CONTENT---\\n💡 提示：使用 /brain 命令进行深度知识检索"}}
EOF
