FROM node:15.0

RUN mkdir app

COPY index.js /app

WORKDIR /app

RUN npm i express bitcoin-rpc-promise

CMD [ "node", "index" ]