FROM ubuntu:latest
WORKDIR /node-51279
RUN mkdir -p /home/node-51279
ADD ~/github/scripts/sample-apps/node/node-51279 /home/node-51279
RUN ls /home
RUN ls /home/node-51279
RUN cd /home/node-51278 && ls
RUN apt-get install -y -q > /dev/null
RUN apt-get update
RUN apt-get -qq install nodejs -y > /dev/null
RUN apt-get install npm -y /dev/null
RUN cd /home/node-51279 && npm install
EXPOSE 51279
CMD ["node", "node-51279-server.js"]
