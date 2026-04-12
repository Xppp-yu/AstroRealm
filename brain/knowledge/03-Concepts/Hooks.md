# Hooks

> Claude Code 的自动化机制，在特定事件发生时自动执行命令或脚本

## 概述
Hooks（钩子）允许在 Claude Code 的特定事件点自动执行预定义的脚本或命令，实现自动化工作流。

## 钩子类型
| 事件 | 触发时机 | 典型用途 |
|------|----------|----------|
| SessionStart | 新对话开始时 | 加载上下文、初始化 |
| UserPromptSubmit | 用户发送消息时 | 智能检索、内容过滤 |
| PostToolUse | 工具执行后 | 自动格式化、检查 |
| PreToolUse | 工具执行前 | 验证、参数修改 |
| Stop | 对话结束时 | 清理、总结、备份 |

## CoBrain 使用的钩子

### SessionStart
加载知识库状态，让我了解之前的上下文。
- 脚本: `E:\CoBrain\scripts\load-cobrain.sh`
- 输出: MOC、最近日志、概念列表

### UserPromptSubmit
智能检索用户消息中的关键词，显示相关知识。
- 脚本: `E:\CoBrain\scripts\smart-search.sh`
- 输出: "📚 检索到相关内容"

## 配置方式
位置: `~/.claude/settings.json`

```json
{
  "hooks": {
    "SessionStart": [
      {
        "command": "bash E:/CoBrain/scripts/load-cobrain.sh",
        "description": "加载 CoBrain 知识库状态"
      }
    ],
    "UserPromptSubmit": [
      {
        "command": "bash E:/CoBrain/scripts/smart-search.sh \"$USER_PROMPT\"",
        "description": "智能检索相关知识"
      }
    ]
  }
}
```

## 最佳实践
1. **保持简洁**：钩子脚本应快速执行
2. **错误处理**：脚本应有 graceful degradation
3. **可配置**：通过环境变量控制行为
4. **日志记录**：记录执行结果便于调试

## 相关链接
- [[Claude-Code]] - Claude Code 主词条
- [[CoBrain]] - 共脑知识库
- [[Skills]] - 能力扩展系统

## 分类
#Claude-Code #自动化 #配置

## 参考资源
- [Claude Code Hooks 文档](https://docs.anthropic.com/claude-code/hooks)

---
*创建于 2026-04-10* · *最后更新于 2026-04-12*
