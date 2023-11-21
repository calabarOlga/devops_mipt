FROM nginx:1.25.3-alpine-slim
COPY nginx_post.conf /etc/nginx/conf.d/nginx_post.conf