FROM alpine:latest
RUN apk add --no-cache shadowsocks-rust

# 直接通过命令行参数启动服务
CMD exec ssserver \
    -s "0.0.0.0:8388" \
    -m "aes-256-gcm" \
    -k "your_password" \
    --timeout 300
