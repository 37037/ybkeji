# 1. 构建阶段
FROM node:18 AS build-stage
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 2. 运行阶段
FROM nginx:stable-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]