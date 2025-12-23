# 1. 构建阶段
FROM node:18 AS build-stage
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 2. 运行阶段
FROM nginx:stable-alpine
# 复制前端构建产物
COPY --from=build-stage /app/dist /usr/share/nginx/html
# 复制自定义 Nginx 配置（含反向代理）
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]