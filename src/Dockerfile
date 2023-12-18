FROM node:18.19.0-alpine

RUN mkdir -p /var/www/html && \
    chown -R node:node /var/www/html

WORKDIR /var/www/html

COPY --chown=node:node package*.json ./

USER node

RUN npm install --omit=dev

COPY --chown=node:node . .

EXPOSE 6969

CMD [ "npm", "start" ]