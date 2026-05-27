FROM alpine:latest
RUN apk add --no-cache shadowsocks-rust

ENV PORT=8388

CMD exec ssserver -s "0.0.0.0:${PORT}" -m "aes-256-gcm" -k "${SS_PASSWORD}" --timeout 300
