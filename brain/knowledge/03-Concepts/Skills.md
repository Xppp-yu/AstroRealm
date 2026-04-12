# Skills

> Claude Code 的能力扩展系统，提供特定领域的知识和工作流

## 概述
Skills 是 Claude Code 的内置能力模块，为特定任务提供专业的知识和工作流程指导。与 Plugins（MCP 外部工具连接器）不同，Skills 是纯知识型扩展。

## Skills vs Plugins

| 类型 | 用途 | 示例 |
|------|------|------|
| **Skills** | 内置能力/知识库 | `python-patterns`、`tdd-workflow` |
| **Plugins** | 外部工具连接器 (MCP) | `github`、`slack`、`supabase` |

## 目录结构
```
C:\Users\23939\.claude\skills\  → 符号链接到 E:\.claude-data\skills\
                                        ↓
                                   151 个官方 skills (155MB)
E:\CoBrain\.claude\skills\       → 自己创建的 skills
                                        └── /brain (深度知识检索)
```

## 分类（151 个官方 Skills）

### 代码审查类
| Skill | 功能 |
|-------|------|
| `/code-review` | 通用代码审查 |
| `/python-review` | Python 代码审查 |
| `/go-review` | Go 代码审查 |
| `/rust-review` | Rust 代码审查 |

### 测试驱动类
| Skill | 功能 |
|-------|------|
| `/tdd` | 测试驱动开发工作流 |
| `/test-coverage` | 测试覆盖率检查 |
| `/e2e` | E2E 测试 |

### 构建修复类
| Skill | 功能 |
|-------|------|
| `/build-fix` | 通用构建修复 |
| `/go-build` | Go 构建修复 |
| `/rust-build` | Rust 构建修复 |

### 项目管理类
| Skill | 功能 |
|-------|------|
| `/projects` | 列出项目列表 |
| `/plan` | 实现计划 |
| `/feature-dev` | 功能开发引导 |

## 自定义 Skill
可在 `E:\CoBrain\.claude\skills\` 创建自定义 Skills。

### 示例：/brain
深度知识检索命令，用于检索 CoBrain 知识库。

## 相关链接
- [[Claude-Code]] - AI 编程助手
- [[lark-cli]] - 飞书 CLI（含 Skill 安装）
- [[分类：Claude-Code]]

## 分类
#Claude-Code #扩展系统

## 参考资源
- [Claude Code Skills 文档](https://docs.anthropic.com/claude-code/skills)

---
*创建于 2026-04-12*
