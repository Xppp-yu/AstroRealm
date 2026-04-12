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
│   │   ├── collaboration/           # 协作模式库
│   │   ├── feedback/                # 反馈系统
│   │   └── config/                  # 配置
│   │
│   └── hooks/                       # 自动化脚本
│
├── skills/                          # 🔧 技能库
│   ├── own/                         # 自己创建的 skills
│   └── linked/                      # 其他仓库的 skills 链接
│
└── docs/                            # 📄 文档
    ├── history.md                   # 项目历史
    ├── daily-log/                   # 开发日志
    ├── ARCHITECTURE.md              # 架构说明
    └── GROWTH.md                    # 成长记录
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

```
skills/
├── own/                 # 自己创建
└── linked/              # 第三方链接
```

### 3. Docs 文档

开发日志、架构说明、成长记录。

## 快速导航

| 入口 | 说明 |
|------|------|
| [CoBrain 知识库](./brain/knowledge/MOC.md) | 知识库索引 |
| [动态记忆系统](./brain/memory/persona/base.md) | AI 人设定义 |
| [架构说明](./docs/ARCHITECTURE.md) | 系统架构 |
| [项目历史](./docs/history.md) | 发展历程 |

## 相关仓库

| 仓库 | 位置 | 用途 |
|------|------|------|
| CoBrain | E:/CoBrain | 本地知识库（试错区） |
| ClaudeStudio | E:/ClaudeStudio | 项目工作区 |
| AstroRealm | 本仓库 | 稳定版 + GitHub |

## 使用方式

### 从 CoBrain 同步

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

## 版本历史

| 日期 | 版本 | 说明 |
|------|------|------|
| 2026-04-12 | v0.2 | 融合重构，brain + skills + docs |
| 2026-03-29 | v0.1 | Stable Core 架构（已废弃） |

详细历史见 [docs/history.md](./docs/history.md)

---

*创建于 2026-03-13* · *最后更新于 2026-04-12* 
*本仓库是个人学习和探索的记录，欢迎交流但请勿盲目模仿*
