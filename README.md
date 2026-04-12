# AstroRealm：共脑系统仓库

> 稳定版共脑系统 + 技能库，定期推送到 GitHub

## 项目定位

```
┌─────────────────────────────────────────────────────────────┐
│                    工作流架构                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CoBrain (E:/CoBrain)                                        │
│  ══════════════════                                         │
│  → 独立工作区（Obsidian 打开）                               │
│  → 日常使用、试错、探索                                       │
│  → 成熟后再同步到 AstroRealm                                 │
│                                                             │
│         ↓ 成熟后筛选                                         │
│                                                             │
│  AstroRealm (本仓库)                                         │
│  ══════════════════                                         │
│  → 稳定版本仓库                                              │
│  → 推送到 GitHub 分享                                        │
│  → brain/ + skills/ + docs/                                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## 目录结构

```
AstroRealm/
├── brain/                           # 🧠 共脑系统
│   ├── knowledge/                   # 知识库（成熟后的笔记）
│   │   ├── MOC.md                   # 索引入口
│   │   ├── 01-Daily/                # 每日日志
│   │   ├── 02-Projects/             # 项目笔记
│   │   ├── 03-Concepts/             # 原子笔记
│   │   ├── 05-Decisions/            # 决策记录
│   │   ├── 06-Templates/            # 笔记模板
│   │   ├── 07-Wiki/                 # 沉淀知识
│   │   └── 08-Categories/           # 分类页面
│   │
│   ├── memory/                      # 动态记忆系统
│   │   ├── persona/                 # 动态人设
│   │   │   ├── base.md              # 基础人设
│   │   │   ├── preferences.md       # 用户偏好（动态更新）
│   │   │   ├── lessons/             # 学到的教训
│   │   │   └── versions/            # 版本历史
│   │   ├── collaboration/           # 协作模式库
│   │   ├── feedback/                # 反馈系统
│   │   └── config/                  # 配置
│   │
│   └── hooks/                       # 自动化脚本
│       ├── session-start.sh         # 会话启动
│       ├── session-end.sh           # 会话结束
│       └── iterate.sh               # 迭代优化
│
├── skills/                          # 🔧 技能库
│   ├── own/                         # 自己创建的 skills
│   └── linked/                      # 其他仓库的 skills 链接
│
└── docs/                            # 📄 文档
    ├── daily-log/                   # 开发日志
    ├── ARCHITECTURE.md              # 架构说明
    ├── GROWTH.md                    # 成长记录
    └── INTEGRATION_PLAN.md          # 融合计划
```

## 核心组件

### 1. Brain 共脑系统

跨模型一致性协作系统，确保更换 API 后仍能保持一致的协作体验。

| 组件 | 功能 |
|------|------|
| **knowledge/** | 知识库，成熟后的笔记 |
| **memory/** | 动态人设 + 反馈系统 |
| **hooks/** | 自动化脚本 |

### 2. Skills 技能库

收集和整理的 Claude Code Skills。

```
skills/
├── own/                 # 自己创建
│   └── my-skill/
└── linked/              # 第三方链接
    └── awesome-skills.md   # 列出其他仓库的好 skills
```

### 3. Docs 文档

开发日志、架构说明、成长记录。

## 使用方式

### 从 CoBrain 同步

当 CoBrain 中的内容成熟后，复制到 AstroRealm：

```bash
# 同步单个文件
cp E:/CoBrain/03-Concepts/xxx.md E:/ClaudeStudio/AstroRealm/brain/knowledge/03-Concepts/

# 同步整个目录
cp -r E:/CoBrain/01-Daily/ E:/ClaudeStudio/AstroRealm/brain/knowledge/
```

### 推送到 GitHub

```bash
cd E:/ClaudeStudio/AstroRealm
git add -A
git commit -m "docs: 更新 xxx"
git push origin main
```

## 相关仓库

- **CoBrain** - 本地知识库（E:/CoBrain）
- **ClaudeStudio** - 项目工作区（E:/ClaudeStudio）

## 版本历史

| 日期 | 版本 | 说明 |
|------|------|------|
| 2026-04-12 | v0.2 | 重构为 brain + skills + docs 结构 |
| 2026-03-29 | v0.1 | Stable Core 架构（已移除） |

---
*创建于 2026-03-13* · *最后更新于 2026-04-12*
