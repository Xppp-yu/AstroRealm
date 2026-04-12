#!/bin/bash
# CoBrain 智能检索钩子 - 简化版
# 检测关键词并检索相关笔记

COBRAIN_DIR="/e/CoBrain"

# 读取用户消息
read -d '' USER_INPUT

# 提取可能的英文关键词（技术术语、项目名等）
ENGLISH_KEYWORDS=$(echo "$USER_INPUT" | grep -oE '\b[A-Za-z][A-Za-z0-9_-]{2,}\b' | sort -u | head -5)

# 提取中文关键词（简化版：提取2-6字的词组）
CHINESE_KEYWORDS=$(echo "$USER_INPUT" | grep -oE '[\u4e00-\u9fa5]{2,6}' | sort -u | head -5 2>/dev/null || echo "")

# 合并关键词
KEYWORDS="$ENGLISH_KEYWORDS $CHINESE_KEYWORDS"

# 如果没有关键词，直接退出
if [ -z "$(echo $KEYWORDS | tr -d ' ')" ]; then
    echo '{}'
    exit 0
fi

# 搜索结果
FOUND=""

# 对每个关键词搜索
for kw in $KEYWORDS; do
    # 跳过常见词
    case "$kw" in
        "the"|"this"|"that"|"what"|"how"|"why"|"can"|"you"|"for"|"with"|"from"|"的"|"是"|"在"|"有"|"和"|"了"|"我"|"你"|"什么"|"怎么"|"如何") continue ;;
    esac

    # 搜索概念笔记
    for f in "$COBRAIN_DIR/03-Concepts"/*.md; do
        [ -f "$f" ] || continue
        if grep -qi "$kw" "$f" 2>/dev/null; then
            name=$(basename "$f" .md)
            FOUND="$FOUND [[${name}]](概念)"
        fi
    done

    # 搜索日志
    for f in "$COBRAIN_DIR/01-Daily"/*.md; do
        [ -f "$f" ] || continue
        if grep -qi "$kw" "$f" 2>/dev/null; then
            name=$(basename "$f" .md)
            FOUND="$FOUND [[${name}]](日志)"
        fi
    done

    # 搜索项目笔记
    for f in "$COBRAIN_DIR/02-Projects"/*.md; do
        [ -f "$f" ] || continue
        if grep -qi "$kw" "$f" 2>/dev/null; then
            name=$(basename "$f" .md)
            FOUND="$FOUND [[${name}]](项目)"
        fi
    done

    # 搜索决策记录
    for f in "$COBRAIN_DIR/05-Decisions"/*.md; do
        [ -f "$f" ] || continue
        if grep -qi "$kw" "$f" 2>/dev/null; then
            name=$(basename "$f" .md)
            FOUND="$FOUND [[${name}]](决策)"
        fi
    done
done

# 去重
FOUND=$(echo "$FOUND" | tr ' ' '\n' | sort -u | tr '\n' ' ')

# 如果找到结果，输出提示
if [ -n "$FOUND" ]; then
    # 读取第一个匹配的笔记内容（简要）
    FIRST_NOTE=$(echo "$FOUND" | grep -oE '\[\[([^\]]+)\]' | head -1 | sed 's/\[\[//;s/\]\]//')
    if [ -n "$FIRST_NOTE" ]; then
        NOTE_FILE=$(find "$COBRAIN_DIR" -name "${FIRST_NOTE}.md" 2>/dev/null | head -1)
        if [ -f "$NOTE_FILE" ]; then
            CONTENT=$(head -20 "$NOTE_FILE" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | awk '{printf "%s\\n", $0}')
        fi
    fi

    cat << EOF
{"systemMessage":"📚 CoBrain 检索到相关内容：${FOUND}","hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"### 相关笔记内容\\n${CONTENT}"}}
EOF
else
    echo '{}'
fi
