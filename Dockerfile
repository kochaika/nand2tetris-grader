FROM node:20.15.0
LABEL authors="Konstantin.Chaika"


RUN git clone https://github.com/nand2tetris/web-ide /web-ide

WORKDIR /web-ide
RUN npm install
RUN npm run preinstall-cli
RUN npm install -g ./cli

WORKDIR /

ENTRYPOINT ["nand2tetris", "grade"]
