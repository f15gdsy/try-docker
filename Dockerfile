FROM node:8.2.1

ENV NODE_ENV=production
ENV HOST 0.0.0.0

# Replace NPM registry to Taobao
RUN npm set registry https://registry.npm.taobao.org && \
    npm set registry https://registry.npm.taobao.org && \
    npm set registry https://registry.npm.taobao.org && \
    npm set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents

RUN mkdir -p /app
WORKDIR /app

# Use Yarn to install NPM packages
RUN npm install -g -s --no-progress yarn
COPY package.json yarn.lock ./
RUN yarn

COPY . ./

# Expose the app port
EXPOSE 3000

RUN npm run build
CMD ["npm", "start"]
