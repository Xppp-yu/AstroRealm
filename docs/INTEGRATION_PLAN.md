# AstroRealm 融合架构方案

## 设计目标

将三个强相关的项目融合成一个统一的共脑系统：
- AstroRealm（总系统）- Stable Core + Infinite Skills
- CoBrain（知识库）- 知识记录与管理
- 动态记忆系统 - 跨模型一致性

## 新架构

```
AstroRealm/                          # 总系统根目录
│
├── core/                            # Stable Core（核心引擎）
│   ├── core_v0.1.py
│   └── skill_interface.py
│
├── brain/                           # 🧠 共脑系统（新融合）
│   │
│   ├── knowledge/                   # 知识库（原 CoBrain）
│   │   ├── MOC.md                   # 索引入口
│   │   ├── HOME.md                  # 主页面板
│   │   ├── 00-Inbox/                # 快速捕获
│   │   ├── 01-Daily/                # 每日日志
│   │   ├── 02-Projects/             # 项目笔记
│   │   ├── 03-Concepts/             # 原子笔记
│   │   ├── 04-Questions/            # 待探索问题
│   │   ├── 05-Decisions/            # 决策记录
│   │   ├── 06-Templates/            # 笔记模板
│   │   ├── 07-Wiki/                 # 沉淀知识
│   │   ├── 08-Categories/           # 分类页面
│   │   └── 99-Archive/              # 归档
│   │
│   ├── memory/                      # 动态记忆系统
│   │   ├── persona/                 # 动态人设
│   │   │   ├── base.md
│   │   │   ├── preferences.md
│   │   │   ├── lessons/
│   │   │   └── versions/
│   │   ├── collaboration/           # 协作模式库
│   │   │   ├── patterns.md
│   │   │   ├── workflows/
│   │   │   └── commands/
│   │   ├── feedback/                # 反馈系统
│   │   │   ├── pending.md
│   │   │   ├── collected/
│   │   │   └── processed/
│   │   └── config/                  # 配置
│   │       ├── api-compat.json
│   │       └── settings.json
│   │
│   └── hooks/                       # 共脑钩子脚本
│       ├── session-start.sh
│       ├── session-end.sh
│       ├── iterate.sh
│       └── smart-search.sh
│
├── skills/                          # Infinite Skills（技能包）
│   └── (各种技能模块)
│
├── docs/                            # 文档
│   ├── ARCHITECTURE.md
│   ├── GROWTH.md
│   ├── IMPLEMENTATION_NOTES.md
│   └── daily-core-log/
│
├── config/                          # 全局配置
│   └── config.yaml
│
└── README.md                        # 总入口
```

## 三层架构

```
┌─────────────────────────────────────────────────────────────┐
│                    AstroRealm 共脑系统                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  第一层：Stable Core                                         │
│  ──────────────────                                         │
│  core/ - 极简核心引擎                                        │
│  - 接收任务 → 调用 Skill → 返回结果 → 记录日志              │
│  - 永不死亡的最小链路                                        │
│                                                             │
│  第二层：共脑系统                                             │
│  ──────────────────                                         │
│  brain/ - 知识 + 记忆 + 钩子                                 │
│  - knowledge/  知识库（原 CoBrain）                          │
│  - memory/    动态记忆系统                                   │
│  - hooks/     自动化脚本                                    │
│                                                             │
│  第三层：Infinite Skills                                     │
│  ──────────────────                                         │
│  skills/ - 可插拔技能包                                      │
│  - 各种功能模块                                              │
│  - 专业领域扩展                                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## 数据流

```
用户输入
    │
    ▼
┌──────────────┐
│ Stable Core  │ ─── 接收任务
└──────────────┘
    │
    ▼
┌──────────────┐
│   Hooks      │ ─── 加载 brain/memory（人设 + 偏好）
└──────────────┘    加载 brain/knowledge（知识库）
    │
    ▼
┌──────────────┐
│    Skill     │ ─── 执行具体任务
└──────────────┘
    │
    ▼
┌──────────────┐
│   Brain      │ ─── 记录结果到知识库
└──────────────┘    更新记忆系统
    │
    ▼
返回结果给用户
```

## 融合优势

1. **统一入口** - 一个仓库管理所有组件
2. **数据一致** - 知识库和记忆系统同源
3. **版本同步** - Git 统一管理版本
4. **易于分享** - 一键推送完整系统
5. **模块化** - 各组件仍保持独立性

---
*设计于 2026-04-12*
