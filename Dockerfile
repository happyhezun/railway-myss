FROM alpine:latest
RUN apk add --no-cache shadowsocks-rust

# 生成配置文件（替换为你的实际值）
RUN echo '{
    "server": "0.0.0.0",
    "server_port": 8388,
    "password": "your_fixed_password",
    "method": "aes-256-gcm",
    "timeout": 300
}' > /etc/shadowsocks-rust/config.json

# 直接通过配置文件启动
CMD exec ssserver -c /etc/shadowsocks-rust/config.json
