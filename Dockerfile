FROM debian:buster-slim

WORKDIR /

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install nano -y
RUN apt-get install net-tools -y
RUN apt-get install nethogs -y
RUN apt-get install zip -y

RUN apt-get install -y nodejs npm
RUN apt-get install -y libgtk-3-0
RUN apt install -y git
RUN npm -v

#RUN curl -fsSL https://deb.nodesource.com/setup_15.x | -E bash -
RUN npm i pm2 -g

RUN git clone https://github.com/ZENZO-Ecosystem/zenzo-forge.git forge
RUN cd forge
RUN npm i
RUN cd lib
WORKDIR /forge/lib/
RUN dir
RUN pm2 start index.js

WORKDIR /

RUN wget https://github.com/ZENZO-Ecosystem/ZENZO-Core/releases/download/v2.1.0/zenzo-2.1.0-x86_64-linux-gnu.tar.gz
RUN tar -xvf zenzo-2.1.0-x86_64-linux-gnu.tar.gz
RUN chmod +x zenzo-2.1.0/bin/zenzod \
    && mkdir .zenzo \
    && cd .zenzo

COPY zenzo.conf /root/.zenzo/zenzo.conf
COPY config.json /forge/

WORKDIR /

RUN dir

RUN cp /zenzo-2.1.0/bin/zenzo-cli /usr/local/bin/

COPY start.sh /
RUN chmod +x start.sh

CMD ["pm2-runtime", "/forge/lib/index.js"]