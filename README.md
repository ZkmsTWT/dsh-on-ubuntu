# DSH（DeepSeek Harness）在手机 Ubuntu 环境部署教程

> **在 Android 手机 Ubuntu 容器中运行 DeepSeek Harne ss**

## 环境

- Android 手机（aarch64）
- Ubuntu 容器（proot 环境，如 Termux）
- Node.js v24+、npm
- 已安装构建工具链（cmake、clang、make、binutils）

## 一键安装

```bash
apt-get update
apt-get install -y cmake clang make binutils pkg-config python3 nodejs git
git clone https://github.com/FunnelCakes/deepseek-harness-android.git
cd deepseek-harness-android
bash setup.sh
```

## 启动

```bash
# 启动 DSH Web 服务
nohup npx dsh web > /tmp/dsh.log 2>&1 &

# 检查
pgrep -f 'dsh'

# 停止
pkill -f 'dsh'
```

## 访问

http://127.0.0.1:3080

## 配置

- 配置文件：~/.dsh/settings.yaml
- API Key：~/.dsh/.credentials.yaml（0600 权限）

## 已测试环境

| 项目 | 版本 |
|------|------|
| 系统 | Linux aarch64 4.14.186+ |
| Node.js | v24.18.1 |
| npm | 11.16.0 |
| Python | 3.12.3 |
| Git | 2.43.0 |

## License

MIT
