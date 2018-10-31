# base image
FROM node:9.6.1

# set working directory
#RUN mkdir /var/www/html/marge
WORKDIR /var/www/html/marge

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /var/www/html/marge/node_modules/.bin:$PATH

# install and cache app dependencies
#RUN scp -r /var/www/html/marge joe@192.168.1.8:/var/www/html/marge
COPY beastie_rsa.pub /var/www/html/marge/beastie_rsa.pub
COPY package.json /var/www/html/marge/package.json
COPY public/index.html /var/www/html/marge/public/index.html
COPY src/index.js /var/www/html/marge/src/index.js
COPY src/App.js /var/www/html/marge/src/App.js
COPY src/ /var/www/html/marge/src/
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

# start app
CMD ["npm", "start"]
