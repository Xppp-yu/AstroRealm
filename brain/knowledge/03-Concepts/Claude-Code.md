# Claude-Code

> Anthropic 官方的 AI 编程助手，在命令行中辅助软件开发

## 概述
Claude Code 是 Anthropic 推出的命令行 AI 助手，可以直接在终端中进行代码编写、重构、调试、项目管理等操作。

## 核心能力
- **代码编写**：生成、修改、重构代码
- **文件操作**：读写、搜索、创建文件
- **命令执行**：运行终端命令
- **项目管理**：规划、测试、部署
- **Git 操作**：提交、分支、PR 管理

## 相关系统

### ClaudeStudio
项目工作目录，存放所有项目输入输出。
- 位置: `E:\ClaudeStudio`
- 结构: 按项目分类，每个项目有 input/output

### CoBrain
共脑知识库，存储交流日志和知识笔记。
- 位置: `E:\CoBrain`
- 特性: Obsidian 双链结构

### Memory
持久化记忆系统，存储用户偏好和项目上下文。
- 位置: `~/.claude/projects/memory/`

## Skills 系统
Claude Code 的能力扩展机制：
- **Skills**：内置能力/知识库（如 `python-patterns`、`tdd-workflow`）
- **Plugins**：外部工具连接器（MCP 协议）
- 位置: `E:\.claude-data\skills\`

## Hooks 系统
自动化执行机制，详见 [[Hooks]]。

## 相关链接
- [[Hooks]] - 自动化钩子系统
- [[Git]] - 版本控制集成
- [[lark-cli]] - 飞书 CLI 集成
- [[Skills]] - 能力扩展系统

## 分类
#工具 #AI #开发工具

## 参考资源
- [Claude Code 官方文档](https://docs.anthropic.com/claude-code)
- [GitHub Issues](https://github.com/anthropics/claude-code/issues)

---
*创建于 2026-04-10* · *最后更新于 2026-04-12*
