FROM node:4.4.3-slim

WORKDIR /dinobot

RUN npm install -g yo generator-hubot 

# yo requires uid/gid 501
RUN groupadd -g 501 dinozombie && \
  useradd -m -u 501 -g 501 dinozombie

COPY ["external-scripts.json","package.json","scripts/"]

RUN mkdir /dinobot/bin

RUN chown -R dinozombie /dinobot

USER dinozombie

RUN yo hubot --adapter campfire --owner denozombie --name dinobot --description DinosaurRobot

RUN chown -R dinozombie /dinobot

CMD ./bin/hubot
