FROM registry.redhat.io/ubi8/nodejs-10

# Add application sources
ADD app-src .
RUN npm install

CMD npm run -d start
