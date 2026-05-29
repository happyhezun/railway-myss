#!/bin/bash

# 确保运行时目录存在
mkdir -p /etc/sing-box

# 验证核心变量是否存在，不存在则赋予安全的默认值
if [ -z "$PROXY_UUID" ]; then
    echo "ERROR: PROXY_UUID is not set. Please set it in Railway variables."
    exit 1
fi

if [ -z "$PROXY_PATH" ]; then
    echo "WARNING: PROXY_PATH is not set, using default /ray"
    export PROXY_PATH="/ray"
fi

# 使用 envsubst 动态替换环境变量，生成最终的 config.json
envsubst '$PORT,$PROXY_UUID,$PROXY_PATH' < /config.json.template > /etc/sing-box/config.json

echo "Configuration generated successfully. Starting sing-box..."

# 启动并接管服务
exec sing-box run -c /etc/sing-box/config.json
