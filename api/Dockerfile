FROM node:14.17.3
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY package*.json ./   
RUN npm install
COPY . .
ENTRYPOINT npm start
EXPOSE 8081