# Git

> 分布式版本控制系统，记录文件修改历史，支持多人协作开发

## 概述
Git 是目前最流行的版本控制工具，用于追踪代码变更、管理项目历史、支持团队协作。

## 四层架构
```
远程仓库 ←push/pull→ 本地仓库 ←commit→ 暂存区 ←add→ 工作区
```

| 区域 | 作用 |
|------|------|
| 工作区 | 写代码的地方 |
| 暂存区 | 选择要提交的文件 |
| 本地仓库 | 存储所有版本历史 |
| 远程仓库 | 云端备份分享 |

## 核心概念
- **commit**: 版本快照，记录某一时刻的完整状态
- **branch**: 独立开发线，隔离不同功能的开发
- **HEAD**: 当前位置指针，指向当前分支或提交
- **merge**: 合并分支，整合不同开发线

## 常用命令
```bash
# 初始化
git init

# 暂存与提交
git add .
git commit -m "message"

# 分支操作
git branch <name>
git checkout <branch>
git merge <branch>

# 远程操作
git push origin main
git pull origin main
```

## 安全恢复
```bash
# 只恢复特定目录，不影响其他
git checkout <commit> -- <目录>/

# 撤销最近一次提交（保留修改）
git reset --soft HEAD~1
```

## 相关链接
- [[Claude-Code]] - AI 编程助手
- [[分支管理]] - Git 分支策略
- [[.gitignore]] - 忽略文件配置

## 分类
#工具 #版本控制 #开发工具

## 参考资源
- [Git 官方文档](https://git-scm.com/doc)
- [Pro Git 电子书](https://git-scm.com/book/zh/v2)

---
*创建于 2026-04-10* · *最后更新于 2026-04-12*
