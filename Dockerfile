# base image
FROM node:9.6.1

# set working directory
RUN mkdir /var/www/html/marge
WORKDIR /var/www/html/marge

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /var/www/html/marge/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /var/www/html/marge/package.json
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

# start app
CMD ["npm", "start"]
