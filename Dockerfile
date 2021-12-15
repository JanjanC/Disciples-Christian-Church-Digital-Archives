FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If production:
# RUN npm ci --only=production

# Bundle app source
COPY . .

# Expose HTTP Port
EXPOSE 8080
# 80 for PRODUCTION

# Run all automated tests
RUN npm test

# Run the application
CMD [ "node", "app.js" ]