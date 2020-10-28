FROM node:10.15.3 as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM registry.redhat.io/rhel8/nginx-116
WORKDIR /opt/build-your-own-radar
COPY --from=source /src/build-your-own-radar/dist .
COPY default.template /etc/nginx/nginx.conf
# CMD ["nginx", "-g", "daemon off;"]
