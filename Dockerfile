FROM debian:buster-slim

WORKDIR /

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install nano -y
RUN apt-get install net-tools -y
RUN apt-get install nethogs -y
RUN apt-get install zip -y


RUN wget https://github.com/ZENZO-Ecosystem/ZENZO-Core/releases/download/v2.1.0/zenzo-2.1.0-x86_64-linux-gnu.tar.gz
RUN tar -xvf zenzo-2.1.0-x86_64-linux-gnu.tar.gz
RUN chmod +x zenzo-2.1.0 \
    && mkdir .zenzo \
    && cd .zenzo \
    && touch zenzo.conf

COPY zenzo.conf .zenzo/
#RUN echo "rpcuser=user \
#rpcpassword=EZiIuXutqp2Nf79LVQ \
#rpcallowip=127.0.0.1 \
#server=1 \
#daemon=1 \
#logtimestamps=1 \
#maxconnections=256 \
#masternode=1 \
#externalip=0.0.0.0 \
#masternodeprivkey=AAAABBBBBB11111XXXXX" > zenzo.conf

RUN cp /zenzo-2.1.0/bin/zenzo-cli /usr/local/bin/

CMD ["/zenzo-2.1.0/bin/zenzod"]