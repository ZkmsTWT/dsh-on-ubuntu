#!/bin/bash
# DSH (DeepSeek Harness) 一键启动
# 用法: bash /root/start_dsh_v2.sh

# 用端口检测（不匹配自身）
if ss -tlnp 2>/dev/null | grep -q ':3080'; then
    echo "✅ DSH 已在线 (3080)"
    echo "👉 http://127.0.0.1:3080"
    exit 0
fi

# 没在跑就启动
cd ~/.dsh 2>/dev/null || mkdir -p ~/.dsh
nohup npx dsh web > /tmp/dsh.log 2>&1 &
sleep 10

if ss -tlnp | grep -q ':3080'; then
    echo "✅ DSH 启动成功"
    echo "👉 http://127.0.0.1:3080"
else
    echo "✗ 启动失败，看: cat /tmp/dsh.log"
fi
