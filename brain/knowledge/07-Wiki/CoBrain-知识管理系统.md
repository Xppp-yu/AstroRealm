# CoBrain 知识管理系统

> 人机共脑的知识库系统，维基风格的知识管理

## 概述
CoBrain 是一个基于 Obsidian 的知识管理系统，采用维基百科风格的笔记结构，支持三层知识体系：日志、原子笔记、沉淀知识。

## 知识结构

### 三层体系
| 层级 | 目录 | 用途 |
|------|------|------|
| 日志层 | 01-Daily | 每日活动记录，时间线视角 |
| 原子笔记层 | 03-Concepts | 知识卡片，一个小知识点一张 |
| 沉淀知识层 | 07-Wiki | 主题整合，知识体系化 |

### 分类系统
- **Tags**: 使用 `#标签` 进行分类
- **分类页面**: `08-Categories/` 目录下的分类索引

### 检索入口
- **MOC**: `MOC.md` 知识图谱入口
- **双链**: 通过 `[[词条名]]` 跳转

## 核心词条
- [[Claude-Code]] - AI 编程助手
- [[Git]] - 版本控制
- [[Hooks]] - 自动化钩子
- [[lark-cli]] - 飞书 CLI

## 自动化系统

### SessionStart 钩子
对话开始时自动加载知识库状态。

### UserPromptSubmit 钩子
用户发送消息时智能检索相关知识。

### /brain Skill
深度知识检索命令。

## 目录结构
```
E:\CoBrain\
├── 00-Inbox/          # 快速捕获
├── 01-Daily/          # 每日日志
├── 02-Projects/       # 项目笔记
├── 03-Concepts/       # 原子笔记（维基词条）
├── 04-Questions/      # 待探索问题
├── 05-Decisions/      # 决策记录
├── 06-Templates/      # 笔记模板
├── 07-Wiki/           # 沉淀知识（主题页面）
├── 08-Categories/     # 分类页面
├── 99-Archive/        # 归档
└── MOC.md             # 知识图谱入口
```

## 相关链接
- [[Claude-Code]] - AI 编程助手
- [[Hooks]] - 自动化钩子
- [[Obsidian]] - 知识管理工具

## 参考资源
- [Zettelkasten 方法](https://zettelkasten.de/)
- [Obsidian 官方文档](https://help.obsidian.md/)

---
*创建于 2026-04-12*
