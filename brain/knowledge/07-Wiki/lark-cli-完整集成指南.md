# lark-cli 完整集成指南

> 从安装到实践，AI 代理操作飞书的完整教程

## 概述
本指南详细介绍如何安装、配置 lark-cli，并让 Claude Code 作为 AI 代理安全地操作飞书各项服务。

## 知识结构
### [[lark-cli]]
飞书官方命令行工具的核心概念和功能模块。

### [[OAuth]]
第三方授权协议，理解 lark-cli 的安全机制。

### [[Skills]]
Claude Code 的能力扩展系统，理解 Skill 和 Plugin 的区别。

## 操作流程

### 第一步：安装 CLI 工具
```bash
npm install -g @larksuite/cli
```

验证安装：
```bash
lark-cli --version
```

### 第二步：安装 Claude Skill
```bash
npx skills add larksuite/cli -y -g
```

这会让 Claude Code 了解 lark-cli 的命令语法。

### 第三步：创建应用配置
```bash
lark-cli config init --new
```

此步骤需要浏览器操作，会创建一个飞书应用。

### 第四步：OAuth 授权
```bash
lark-cli auth login --recommend
```

此步骤需要浏览器操作，用户确认授权范围。

### 第五步：验证状态
```bash
lark-cli auth status
```

确认授权成功，查看已授予的权限。

## 最佳实践

### 权限管理
- 使用最小权限原则，只授予必要的权限
- 定期检查授权应用列表
- 敏感操作建议手动确认

### 安全建议
- Skill 安装 ≠ 直接访问，必须经过 OAuth 授权
- Token 存储在操作系统密钥链中
- 定期轮换 Token

### 常用场景
1. **会议纪要自动化**：会议后自动生成文档
2. **任务管理流水线**：Git PR → 飞书任务联动
3. **团队协作提醒**：定时发送任务提醒

## 常见问题

### Q: 安装 Skill 后就能直接操作飞书吗？
A: 不能。Skill 只提供命令知识，必须经过 OAuth 授权才能访问飞书数据。

### Q: 授权后 AI 可以做什么？
A: 取决于授权的权限范围。可以精确控制 AI 能访问哪些模块（日历、任务、文档等）。

### Q: 如何撤销授权？
A: 运行 `lark-cli auth logout` 或在飞书管理后台删除授权应用。

## 相关链接
- [[lark-cli]] - 核心概念和功能
- [[Claude-Code]] - AI 编程助手
- [[分类：AI工具]] - 更多 AI 工具

## 参考资源
- [GitHub 仓库](https://github.com/larksuite/cli)
- [飞书开放平台](https://open.feishu.cn/)
- [OAuth 2.0 协议](https://oauth.net/2/)

---
*创建于 2026-04-12*
