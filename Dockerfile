FROM ghcr.io/sagernet/sing-box:latest

# 安装 bash 和 envsubst 工具
RUN apk add --no-cache bash gettext

# 复制配置文件模板和启动脚本到容器根目录
COPY config.json.template /config.json.template
COPY entrypoint.sh /entrypoint.sh

# 赋予脚本可执行权限
RUN chmod +x /entrypoint.sh

# 暴露端口
EXPOSE 10000

# 运行引导脚本
ENTRYPOINT ["/entrypoint.sh"]
