# 使用 OpenResty 作為基礎映像
FROM openresty/openresty:alpine

RUN apk update && \
    apk add vim bash
# 複製 nginx.conf 文件到容器內
COPY ./nginx/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# 複製靜態文件到容器內
COPY build /usr/local/openresty/nginx/html

# 複製 Lua 文件到容器內
COPY ./nginx/lua /usr/local/openresty/nginx/lua

# 暴露端口
EXPOSE 80

# 啟動 Nginx
CMD ["openresty", "-g", "daemon off;"]
