FROM node:20.15.0
LABEL authors="Konstantin.Chaika"


WORKDIR /
RUN git clone https://github.com/nand2tetris/web-ide

WORKDIR /web-ide
RUN npm install
RUN npm run preinstall-cli
RUN npm install -g ./cli

COPY n2t_grader.py /n2t_grader.py

WORKDIR /

# TODO: fix it
ENTRYPOINT ["sleep", "infinity"]
