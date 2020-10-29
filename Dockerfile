FROM registry.redhat.io/ubi8/nodejs-10

# Add application sources
ADD app-src /tmp/src
WORKDIR /tmp/src
COPY package.json ./
RUN npm install
RUN npm run build
CMD npm run -d start

