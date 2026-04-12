# lark-cli

> 飞书（Lark/Feishu）官方命令行工具，专为人类和 AI 代理设计

## 概述
`lark-cli` 是飞书开放平台推出的官方命令行工具，提供对飞书各项服务的终端访问能力。核心设计理念是 **AI-Agent-Native**，内置 20 个结构化 Skill，使 AI 助手能够零配置操作飞书。

## 功能模块

| 模块 | 功能 | AI 友好度 |
|------|------|-----------|
| **Calendar** | 日程创建/读取/更新/删除 | ⭐⭐⭐⭐⭐ |
| **Task** | 任务管理 | ⭐⭐⭐⭐⭐ |
| **IM** | 消息发送/群聊管理 | ⭐⭐⭐⭐⭐ |
| **Docs** | 文档创建/编辑 | ⭐⭐⭐⭐⭐ |
| **Sheets** | 表格数据操作 | ⭐⭐⭐⭐ |
| **Mail** | 邮件收发 | ⭐⭐⭐⭐ |
| **Base** | 多维表格管理 | ⭐⭐⭐⭐⭐ |
| **Drive** | 文件上传/下载 | ⭐⭐⭐⭐ |
| **Wiki** | 知识库管理 | ⭐⭐⭐⭐ |
| **Contact** | 联系人查询 | ⭐⭐⭐⭐ |
| **Approval** | 审批流程 | ⭐⭐⭐⭐ |
| **VC** | 会议管理 | ⭐⭐⭐⭐ |

## 安装配置

### 基础安装
```bash
# 安装 CLI 工具
npm install -g @larksuite/cli

# 安装 Claude Skill（AI 代理必需）
npx skills add larksuite/cli -y -g
```

### 应用配置
```bash
# 初始化配置（需要浏览器操作）
lark-cli config init --new

# OAuth 授权登录
lark-cli auth login --recommend

# 验证状态
lark-cli auth status
```

### 当前配置
- **版本**: v1.0.8
- **授权应用**: cli_a950f66a60381cb1
- **授权用户**: 用户279155
- **权限范围**: 12 个业务领域，200+ 命令

## AI 代理集成

### 设计特点
- **结构化 Skills**：20 个业务模块独立封装
- **智能默认值**：减少 AI 代理的参数猜测
- **表格输出**：易于 AI 解析的结果格式
- **非阻塞授权**：`--no-wait` 模式适合 AI 流程

### 安全机制
- **Skill ≠ 直接访问**：Skill 只提供命令知识
- **OAuth 授权必需**：用户必须在浏览器中完成授权
- **权限粒度可控**：可以精确控制 API 权限范围
- **凭证本地存储**：Token 存储在操作系统密钥链

## 使用场景

### 会议纪要自动化
```bash
lark-cli docs +create --title "会议纪要" --markdown "# 会议内容..."
```

### 任务管理流水线
```bash
lark-cli task +task-create --title "Review PR #123" --due-time "今天"
```

### 团队协作提醒
```bash
lark-cli im +messages-send --chat-id "群聊ID" --text "记得完成周报"
```

## 权限管理

### 最小权限原则
```bash
# 只授予必要权限
lark-cli auth login --scope "calendar:calendar:read_write,task:task:read_write"
```

### 安全操作
```bash
# 登出（撤销访问）
lark-cli auth logout

# 切换身份
lark-cli command --as user   # 以用户身份
lark-cli command --as bot    # 以机器人身份
```

## 相关链接
- [[OAuth]] - 第三方授权协议
- [[Claude-Code]] - AI 编程助手
- [[Skills]] - Claude Code 技能系统

## 分类
#工具 #飞书 #AI代理

## 参考资源
- [GitHub 仓库](https://github.com/larksuite/cli)
- [飞书开放平台](https://open.feishu.cn/)

---
*创建于 2026-04-11* · *最后更新于 2026-04-12*
