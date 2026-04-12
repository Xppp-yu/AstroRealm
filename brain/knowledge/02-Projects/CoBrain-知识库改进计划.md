# CoBrain 知识库改进计划

> 将 CoBrain 重构为维基风格的智能知识管理系统

## 项目概述

### 目标
- 建立三层知识体系（日志 → 原子笔记 → 沉淀知识）
- 创建美观实用的 HOME 主页面板
- 实现智能知识检索和关联

### 状态
🟡 进行中

## 进度追踪

### Phase 1: 知识库重构 ✅
- [x] 设计三层目录结构
- [x] 创建维基风格模板
- [x] 迁移现有笔记为原子笔记格式
- [x] 创建分类页面系统
- [x] 编写主题页面（沉淀知识）

### Phase 2: HOME 页面开发 ⏳
- [x] 创建 HOME.md 主页面板
- [x] 编写 CSS 样式文件
- [x] 配置 Dataview 插件
- [ ] 调试年度贡献图（GitHub 风格）
- [ ] 测试所有面板功能

### Phase 3: 智能检索集成 📋
- [ ] 更新 SessionStart 钩子
- [ ] 更新 UserPromptSubmit 钩子
- [ ] 更新 /brain Skill
- [ ] 测试检索效果

### Phase 4: 内容完善 📋
- [ ] 填充所有原子笔记
- [ ] 扩展分类页面
- [ ] 编写更多沉淀知识

## 技术栈

| 组件 | 工具 |
|------|------|
| 知识库 | Obsidian |
| 动态查询 | Dataview / DataviewJS |
| 样式 | CSS Snippets |
| 自动化 | Claude Code Hooks |
| 智能检索 | /brain Skill |

## 相关文件

### 目录结构
```
E:\CoBrain\
├── HOME.md              # 主页面板
├── MOC.md               # 知识图谱入口
├── 01-Daily/            # 日志层
├── 02-Projects/         # 项目笔记
├── 03-Concepts/         # 原子笔记（维基词条）
├── 07-Wiki/             # 沉淀知识（主题页面）
├── 08-Categories/       # 分类页面
└── .obsidian/snippets/  # CSS 样式
```

### 关键配置
- `.obsidian/plugins/dataview/data.json` - Dataview 配置
- `.obsidian/snippets/cobrain-home.css` - HOME 样式

## 待解决问题

### 年度贡献图不显示
**症状**：HOME 页面的年度贡献图在阅读模式下不渲染

**可能原因**：
1. DataviewJS 语法错误
2. 日期计算逻辑问题
3. CSS grid 布局问题

**解决方案**：
1. 简化 DataviewJS 代码
2. 使用纯 JavaScript Date 对象
3. 分步调试各组件

## 下一步行动

1. **调试贡献图**：简化代码，先实现基本显示
2. **测试面板**：确认所有面板正常工作
3. **更新钩子**：适配新的知识库结构

## 相关链接

- [[CoBrain-知识管理系统]]
- [[2026-04-12]] - 维基化重构日志
- [[HOME]] - 主页面板

---
*创建于 2026-04-12*
