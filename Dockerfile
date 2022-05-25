FROM node:16-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
