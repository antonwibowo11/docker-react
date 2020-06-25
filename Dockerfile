FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# /usr/share/nginx/html --> from NGINX docs
COPY --from=builder /app/build /usr/share/nginx/html