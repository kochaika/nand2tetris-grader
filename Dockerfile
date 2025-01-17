FROM node:20.15.0
LABEL authors="Konstantin.Chaika"


RUN git clone -b shitfix_project_05 https://github.com/kochaika/web-ide /web-ide

COPY Max.hack /Max.hack

WORKDIR /web-ide
RUN npm install
RUN npm run preinstall-cli
RUN npm install -g ./cli

WORKDIR /

ENTRYPOINT ["nand2tetris", "grade"]
