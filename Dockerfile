FROM node:18 AS build-stage
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:stable-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
# 把证书复制进去
COPY ssl /etc/nginx/ssl
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]