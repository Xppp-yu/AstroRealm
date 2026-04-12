#!/bin/bash
# 动态记忆系统 - 迭代优化脚本
# 分析反馈 + 更新人设 + 同步知识库

PROJECT_DIR="E:/ClaudeStudio/projects/memory-system"
PERSONA_PREFS="$PROJECT_DIR/persona/preferences.md"
FEEDBACK_PENDING="$PROJECT_DIR/feedback/pending.md"
FEEDBACK_COLLECTED="$PROJECT_DIR/feedback/collected"
COBRAIN_DIR="E:/CoBrain"

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔄 动态人设迭代系统"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 检查待处理反馈
PENDING_COUNT=$(grep -c "^### \[" "$FEEDBACK_PENDING" 2>/dev/null || echo "0")

if [ "$PENDING_COUNT" -eq 0 ]; then
    echo "✓ 没有待处理的反馈"
    echo ""
    exit 0
fi

echo "📋 发现 ${PENDING_COUNT} 条待处理反馈"
echo ""

# 备份当前偏好
VERSION=$(grep "更新次数" "$PERSONA_PREFS" 2>/dev/null | grep -o "[0-9]*" || echo "0")
NEW_VERSION=$((VERSION + 1))

# 保存版本历史
mkdir -p "$PROJECT_DIR/persona/versions"
cp "$PERSONA_PREFS" "$PROJECT_DIR/persona/versions/preferences-v${VERSION}-${DATE}.md" 2>/dev/null

# 移动已处理的反馈
mkdir -p "$FEEDBACK_COLLECTED"
mv "$FEEDBACK_PENDING" "$FEEDBACK_COLLECTED/feedback-${DATE}.md"

# 创建新的待处理文件
cat > "$FEEDBACK_PENDING" << 'EOF'
# 待处理反馈

> 用户反馈收集，等待处理

## 反馈格式

```markdown
### [日期] 简短描述

**场景**：这个反馈发生在什么情况下
**问题**：具体是什么不满意
**期望**：希望怎么改进
**优先级**：高/中/低
```

---

## 当前待处理反馈

（暂无）

---
EOF

# 更新偏好文件中的版本信息
sed -i "s/\*最后更新：.*/\*最后更新：${DATE}\*/" "$PERSONA_PREFS" 2>/dev/null
sed -i "s/\*更新次数：.*/\*更新次数：${NEW_VERSION}\*/" "$PERSONA_PREFS" 2>/dev/null

echo "✓ 反馈已处理并归档"
echo "✓ 人设版本已更新：v${VERSION} → v${NEW_VERSION}"
echo ""

# 同步到 CoBrain
COBRAIN_NOTE="$COBRAIN_DIR/03-Concepts/动态记忆系统.md"
if [ -d "$COBRAIN_DIR" ]; then
    cat > "$COBRAIN_NOTE" << EOF
# 动态记忆系统

> 跨模型一致性协作系统

## 系统状态

- 当前版本：v${NEW_VERSION}
- 最后更新：${DATE}
- 项目位置：E:/ClaudeStudio/projects/memory-system

## 核心组件

| 组件 | 位置 | 用途 |
|------|------|------|
| 基础人设 | persona/base.md | 核心行为定义 |
| 用户偏好 | persona/preferences.md | 动态更新的偏好 |
| 协作模式 | collaboration/patterns.md | 成功的模式库 |
| 反馈系统 | feedback/ | 收集和处理反馈 |

## 工作流

\`\`\`
会话启动 → 加载人设 → 协作 → 收集反馈 → 会话结束 → 迭代优化
\`\`\`

## 相关链接

- [[Claude-Code]] - AI 编程助手
- [[CoBrain-知识管理系统]] - 知识库使用指南

---
*创建于 2026-04-12* · *最后更新于 ${DATE}*
EOF
    echo "✓ 已同步到 CoBrain"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ 迭代完成"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
