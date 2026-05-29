FROM ghcr.io/sagernet/sing-box:latest

# 安装 bash 和 envsubst 工具（用于动态生成配置文件）
RUN apk add --no-cache bash gettext

# 暴露 Railway 默认的端口
EXPOSE 10000

# 启动时：将环境变量 $SING_BOX_CONFIG 的内容写入文件，并将里面的 $PORT 动态替换，最后启动 sing-box
ENTRYPOINT ["/bin/bash", "-c", "echo \"$SING_BOX_CONFIG\" | envsubst '$PORT' > /etc/sing-box/config.json && exec sing-box run -c /etc/sing-box/config.json"]
