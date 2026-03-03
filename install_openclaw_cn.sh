#!/bin/bash
# OpenClaw 一键安装脚本（国内优化版）
# 支持 Ubuntu/Debian/CentOS

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}=== OpenClaw 一键安装脚本（国内优化版）===${NC}"
echo ""

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
echo -e "${RED}请使用 root 权限运行: sudo bash install_openclaw_cn.sh${NC}"
exit 1
fi

# 安装 Node.js
install_nodejs() {
echo -e "${YELLOW}正在安装 Node.js...${NC}"
apt-get update -qq && apt-get install -y -qq curl ca-certificates gnupg
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y -qq nodejs
echo -e "${GREEN}Node.js 安装完成: $(node --version)${NC}"
}

# 安装 OpenClaw
install_openclaw() {
echo -e "${YELLOW}正在安装 OpenClaw...${NC}"
npm install -g pnpm
pnpm add -g openclaw
echo -e "${GREEN}OpenClaw 安装完成${NC}"
}

# 安装 Clash 代理
install_clash() {
echo ""
echo -e "${BLUE}=== 代理配置（国内必需）===${NC}"
read -p "是否安装 Clash 代理? (y/n): " INSTALL_CLASH

if [[ "$INSTALL_CLASH" =~ ^[Yy]$ ]]; then
mkdir -p /opt/clash && cd /opt/clash
wget -q "https://github.com/MetaCubeX/mihomo/releases/download/v1.19.2/mihomo-linux-amd64-v1.19.2.gz" -O clash.gz
gunzip -f clash.gz && chmod +x clash && ln -sf /opt/clash/clash /usr/local/bin/clash
wget -q "https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb" -O Country.mmdb

read -p "请输入 Clash 订阅链接: " CLASH_URL
wget -q --user-agent="ClashforWindows/0.19.23" "$CLASH_URL" -O config.yaml

cat > /etc/systemd/system/clash.service << 'EOF'
[Unit]
Description=Clash Proxy
After=network.target
[Service]
ExecStart=/opt/clash/clash -f /opt/clash/config.yaml -d /opt/clash
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload && systemctl enable clash && systemctl start clash
echo -e "${GREEN}Clash 代理已启动 (127.0.0.1:7078)${NC}"
CLASH_RUNNING=true
fi
}

# 配置 Telegram
configure_telegram() {
echo ""
echo -e "${BLUE}=== Telegram 配置 ===${NC}"
read -p "请输入 Telegram Bot Token: " BOT_TOKEN

sudo -u "$SUDO_USER" bash -c "
openclaw config set channels.telegram.botToken '$BOT_TOKEN'
openclaw config set channels.telegram.dmPolicy pairing
openclaw config set channels.telegram.groups.*.requireMention true
openclaw config set channels.telegram.enabled true
"

if [ "$CLASH_RUNNING" = true ]; then
sudo -u "$SUDO_USER" openclaw config set channels.telegram.proxy "http://127.0.0.1:7078"
fi
echo -e "${GREEN}Telegram 配置完成${NC}"
}

# 启动 Gateway
setup_gateway() {
sudo -u "$SUDO_USER" openclaw gateway install
systemctl --user daemon-reload
systemctl --user start openclaw-gateway
systemctl --user enable openclaw-gateway
echo -e "${GREEN}Gateway 服务已启动${NC}"
}

show_status() {
echo ""
echo -e "${GREEN}=== 安装完成 ===${NC}"
echo "常用命令:"
echo " openclaw status"
echo " openclaw pairing list telegram"
echo " openclaw pairing approve telegram <CODE>"
}

main() {
install_nodejs
install_openclaw
install_clash
configure_telegram
setup_gateway
show_status
}

main
