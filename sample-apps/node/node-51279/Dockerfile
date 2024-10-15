FROM ubuntu:latest
WORKDIR /node-51279
RUN mkdir -p /home/node-51279
ADD ~/sample-apps/node/node-51279 /home/node-51279
RUN ls /home
RUN ls /home/node-51279
RUN cd /home/node-51278 && ls
RUN apt-get update
RUN apt-get install nodejs -y > /dev/null
RUN apt-get install npm -y /dev/null
RUN cd /home/node-51279 && npm install
EXPOSE 51279
CMD ["node", "node-51279-server.js"]
