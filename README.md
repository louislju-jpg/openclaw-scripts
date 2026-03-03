# openclaw-scripts
OpenClaw 一键安装脚本
以下是 README.md 的完整内容，你可以直接复制：
[2026/3/3 17:57] 猫猫: 以下是 README.md 的完整内容，你可以直接复制：

# OpenClaw 一键安装脚本

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux-orange.svg)](https://github.com/openclaw/openclaw)
[![Node.js](https://img.shields.io/badge/node-%3E%3D18-brightgreen.svg)](https://nodejs.org/)

在国内服务器一键安装 **OpenClaw** + **Telegram Bot** + **Clash 代理**，无需复杂配置，一条命令搞定。

---

## 📸 截图示例

### 1. 获取 Telegram Bot Token

打开 [@BotFather](https://t.me/BotFather)，发送 `/newbot` 创建机器人：


🤖 BotFather
━━━━━━━━━━━━━━━
/send /newbot

Alright, a new bot. How are we going to call it?
Please choose a name for your bot.

→ 输入: 我的助手Bot

Good. Now let's choose a username for your bot.
It must end in bot. Like this, for example: TetrisBot or tetris_bot.

→ 输入: my_helper_xyz_bot

Done! Congratulations on your new bot.
You will find it at t.me/my_helper_xyz_bot (http://t.me/my_helper_xyz_bot)

Use this token to access the HTTP API:
123456789:ABCdefGHIjklMNOpqrSTUvwxyz

Keep your token secure and store it safely,
it can be used by anyone to control your bot.


**复制保存 `123456789:ABCdefGHIjklMNOpqrSTUvwxyz` 这个 Token**

---

### 2. 获取 Clash 订阅链接

登录你的机场/代理服务商，找到订阅页面：


┌─────────────────────────────────────────┐
│  用户中心 > 订阅管理                      │
├─────────────────────────────────────────┤
│                                         │
│  订阅链接:                               │
│  ┌───────────────────────────────────┐ │
│  │ https://example.com/api/v1/...   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  [复制链接]  [导入 Clash]               │
│                                         │
└─────────────────────────────────────────┘


**点击"复制链接"保存**

---

### 3. 运行安装脚本

```bash
$ curl -fsSL -o install.sh https://raw.githubusercontent.com/... && sudo bash install.sh

=== OpenClaw 一键安装脚本（国内优化版）===

检测到系统: Ubuntu 22.04.3 LTS
Node.js 已安装: v22.2.0
OpenClaw 安装完成: v2026.2.13

=== 代理配置（国内必需） ===
在国内访问 Telegram 需要代理

是否安装 Clash 代理? (y/n): y
正在安装 Clash...
✓ Clash 下载完成
✓ GeoIP 数据库下载完成
请输入 Clash 订阅链接: https://your-subscription-link
✓ 配置下载完成
✓ Clash 代理已启动 (http://127.0.0.1:7078)

=== Telegram 配置 ===
请先通过 @BotFather 创建 Bot 并获取 Token

请输入 Telegram Bot Token: 123456789:ABCdefGHIjklMNOpqrSTUvwxyz
✓ Telegram 配置完成
✓ 已配置 Clash 代理
✓ Gateway 服务已启动

=== 安装完成 ===
✓ Clash 代理运行中 (127.0.0.1:7078)

常用命令:
  sudo systemctl status openclaw-gateway  # 查看 Gateway 状态
  openclaw status                         # 查看 OpenClaw 状态
  openclaw pairing list telegram          # 查看配对请求

下一步:
1. 在 Telegram 里给你的 Bot 发消息
2. 运行: openclaw pairing list telegram
3. 运行: openclaw pairing approve telegram <CODE>


4. Telegram 配对

在 Telegram 里给 Bot 发消息：

👤 你
━━━━━━━━━━━━━━━
你好

🤖 猫猫 (BambouMaoBot)
━━━━━━━━━━━━━━━
OpenClaw Pairing Code: KD6EXYH2

This code expires in 1 hour.
Please provide this code to approve access.

在服务器上批准配对：

$ openclaw pairing list telegram

No pending telegram pairing requests.

# 稍等片刻再次运行
$ openclaw pairing list telegram

Pending telegram pairing requests:
┌───────────┬──────────────┬─────────────────┐
│ Code      │ Username     │ Requested       │
├───────────┼──────────────┼─────────────────┤
│ KD6EXYH2  │ @LouisLju    │ 2 minutes ago   │
└───────────┴──────────────┴─────────────────┘

$ openclaw pairing approve telegram KD6EXYH2
✓ Approved telegram sender 8320419742.


5. 开始使用

配对完成后，在 Telegram 里和 Bot 对话：

👤 你
━━━━━━━━━━━━━━━
你好，请介绍一下自己

🤖 猫猫 (BambouMaoBot)
━━━━━━━━━━━━━━━
你好！我是 OpenClaw AI 助手。

我可以帮你：
• 回答问题和搜索信息
• 编写和调试代码
• 管理服务器和文件
• 设置定时任务和提醒

有什么可以帮你的吗？


✨ 功能特性

• ✅ 全自动安装 - Node.js、OpenClaw、Clash 一键搞定
• ✅ 国内优化 - 内置 Clash 代理，解决 Telegram 连接问题
• ✅ 交互式配置 - 引导输入 Token 和订阅链接
• ✅ 服务化部署 - 自动配置 systemd，开机自启
• ✅ 多系统支持 - Ubuntu / Debian / CentOS

🚀 快速开始

一键安装（推荐）

curl -fsSL -o install.sh https://raw.githubusercontent.com/你的用户名/openclaw-scripts/main/install_openclaw_cn.sh && sudo bash install.sh

分步安装

# 1. 下载脚本
wget https://raw.githubusercontent.com/你的用户名/openclaw-scripts/main/install_openclaw_cn.sh

# 2. 运行安装
sudo bash install_openclaw_cn.sh
[2026/3/3 17:58] 猫猫: 📋 安装流程

运行脚本后，按提示输入以下信息：

| 步骤 | 输入内容               | 获取方式               |
| --- | ------------------ | ------------------ |
| 1  | Telegram Bot Token | @BotFather 创建机器人获取 |
| 2  | 是否安装 Clash         | 国内服务器必须选 y         |
| 3  | Clash 订阅链接         | 从机场/代理服务商获取        |


🖥️ 系统要求

| 项目   | 要求                                               |
| ---- | ------------------------------------------------ |
| 操作系统 | Ubuntu 20.04+ / Debian 10+ / CentOS 7+ / RHEL 8+ |
| 权限   | root 或 sudo 权限                                   |
| 内存   | 最低 512MB，推荐 1GB+                                 |
| 磁盘   | 最低 1GB 可用空间                                      |
| 网络   | 可访问 GitHub（安装时需要）                                |


🛠️ 常用命令

查看状态

# 查看 OpenClaw 状态
openclaw status

# 查看 Gateway 服务状态
sudo systemctl status openclaw-gateway

# 查看 Clash 代理状态
sudo systemctl status clash

配对授权

# 查看待处理的配对请求
openclaw pairing list telegram

# 批准配对（替换 YOUR_CODE）
openclaw pairing approve telegram YOUR_CODE

服务管理

# 重启 Gateway
openclaw gateway restart

# 查看日志
openclaw logs --follow

# 停止服务
systemctl --user stop openclaw-gateway

# 禁用开机自启
systemctl --user disable openclaw-gateway


📁 配置文件位置

| 文件          | 路径                           |
| ----------- | ---------------------------- |
| OpenClaw 配置 | ~/.openclaw/openclaw.json    |
| Clash 配置    | /opt/clash/config.yaml       |
| Clash 数据库   | /opt/clash/Country.mmdb      |
| Gateway 日志  | /tmp/openclaw/openclaw-*.log |
| Clash 日志    | /tmp/clash.log               |


🔧 手动配置代理

如果安装时跳过了 Clash，之后可以手动配置：

# 1. 安装 Clash（参考脚本中的 install_clash 函数）

# 2. 配置 OpenClaw 使用代理
openclaw config set channels.telegram.proxy "http://127.0.0.1:7078"

# 3. 重启 Gateway
openclaw gateway restart


❓ 常见问题

Q1: 安装失败，提示 "command not found: openclaw"

解决: 重新加载环境变量

source ~/.bashrc
# 或
export PATH="$PATH:$HOME/.local/share/pnpm"

Q2: Telegram Bot 无响应

排查步骤:

1. 检查 Gateway 是否运行: openclaw status
2. 检查 Clash 是否运行: sudo systemctl status clash
3. 检查配对是否批准: openclaw pairing list telegram
4. 查看日志: openclaw logs --follow
Q3: Clash 订阅下载失败

解决: 手动下载配置

cd /opt/clash
wget --user-agent="ClashforWindows/0.19.23" "你的订阅链接" -O config.yaml
sudo systemctl restart clash

Q4: 如何更新 OpenClaw？

pnpm update -g openclaw
openclaw gateway restart

Q5: 如何更换 Clash 订阅？

cd /opt/clash
wget --user-agent="ClashforWindows/0.19.23" "新订阅链接" -O config.yaml
sudo systemctl restart clash

Q6: 配对码过期了怎么办？

解决: 重新获取配对码

1. 在 Telegram 里再次给 Bot 发消息
2. 会收到新的配对码
3. 在 1 小时内使用 openclaw pairing approve telegram <新CODE> 批准
Q7: 如何添加多个 Telegram 用户？

解决: 每个用户都需要单独批准

# 查看所有配对请求
openclaw pairing list telegram

# 逐个批准
openclaw pairing approve telegram CODE1
openclaw pairing approve telegram CODE2

或者设置允许列表：

# 添加允许的用户 ID
openclaw config set channels.telegram.allowFrom '["123456789", "987654321"]'
openclaw gateway restart

Q8: 群聊里 Bot 不响应

排查步骤:

1. 确认 Bot 已加入群组
2. 确认在群组里 @了 Bot
3. 检查配置：openclaw config get channels.telegram.groups
4. 查看群组权限：Bot 需要读取消息的权限
解决: 设置群组不需要 @提及

# 允许所有群组，不需要 @提及
openclaw config set channels.telegram.groups.*.requireMention false
openclaw gateway restart

Q9: 如何查看 Bot 收到的消息？

# 实时查看日志
openclaw logs --follow

# 查看特定日期的日志
cat /tmp/openclaw/openclaw-2026-03-03.log | grep telegram

Q10: 服务器重启后 Bot 不工作了

排查:

# 检查服务状态
systemctl --user status openclaw-gateway
sudo systemctl status clash

# 如果未运行，手动启动
systemctl --user start openclaw-gateway
sudo systemctl start clash

解决: 确保服务已启用开机自启

systemctl --user enable openclaw-gateway
sudo systemctl enable clash

Q11: 如何备份配置？

# 备份 OpenClaw 配置
cp ~/.openclaw/openclaw.json ~/openclaw-backup.json

# 备份 Clash 配置
cp /opt/clash/config.yaml ~/clash-config-backup.yaml

# 备份配对列表
openclaw pairing list telegram > ~/pairing-backup.txt

Q12: 如何完全卸载？

# 1. 停止服务
systemctl --user stop openclaw-gateway
sudo systemctl stop clash

# 2. 禁用服务
systemctl --user disable openclaw-gateway
sudo systemctl disable clash

# 3. 删除文件
rm -rf ~/.openclaw
rm -rf /opt/clash
pnpm remove -g openclaw

# 4. 删除 systemd 服务
rm ~/.config/systemd/user/openclaw-gateway.service
[2026/3/3 17:58] 猫猫: sudo rm /etc/systemd/system/clash.service
systemctl --user daemon-reload
sudo systemctl daemon-reload

Q13: 安装时报错 "E: Unable to locate package"

原因: 软件源问题

解决:

# 更新软件源
sudo apt-get update

# 如果还报错，更换国内镜像
sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo apt-get update

Q14: Node.js 版本冲突

解决: 使用 nvm 管理 Node.js

# 安装 nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc

# 安装 Node.js 22
nvm install 22
nvm use 22
nvm alias default 22

# 重新安装 OpenClaw
pnpm add -g openclaw

Q15: Clash 启动失败，端口被占用

排查:

# 查看端口占用
sudo lsof -i :7078
# 或
sudo ss -tlnp | grep 7078

解决:

# 停止占用端口的进程
sudo kill -9 <PID>

# 或修改 Clash 端口
sudo vim /opt/clash/config.yaml
# 修改 mixed-port: 7078 为其他端口，比如 7890

sudo systemctl restart clash


📝 手动安装（不使用脚本）

如果你想手动安装，参考以下步骤：

# 1. 安装 Node.js
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

# 2. 安装 OpenClaw
npm install -g pnpm
pnpm add -g openclaw

# 3. 配置 Telegram
openclaw config set channels.telegram.botToken "YOUR_TOKEN"
openclaw config set channels.telegram.dmPolicy "pairing"
openclaw config set channels.telegram.enabled true

# 4. 安装并启动 Gateway
openclaw gateway install
systemctl --user start openclaw-gateway


🤝 参与贡献

欢迎提交 Issue 和 PR！

1. Fork 本仓库
2. 创建你的特性分支 (git checkout -b feature/AmazingFeature)
3. 提交更改 (git commit -m 'Add some AmazingFeature')
4. 推送到分支 (git push origin feature/AmazingFeature)
5. 打开 Pull Request

📄 许可证

本项目采用 MIT 许可证。


🔗 相关链接

• OpenClaw 官方文档 (https://docs.openclaw.ai/)
• OpenClaw GitHub (https://github.com/openclaw/openclaw)
• Telegram Bot API (https://core.telegram.org/bots/api)
• Clash 文档 (https://docs.metacubex.one/)

💬 交流群

有问题？欢迎加入讨论：

• OpenClaw Discord (https://discord.com/invite/clawd)
• Telegram 群组 (https://t.me/openclaw_cn)

如果本项目对你有帮助，请给个 ⭐ Star 支持一下！


复制以上内容，粘贴到你的 GitHub 仓库的 README.md 文件中即可。
