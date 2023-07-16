FROM ubuntu:22.04

WORKDIR /home

RUN dpkg --add-architecture i386 \
 && apt-get update -y\
 && apt install wget lib32gcc-s1 lib32stdc++6 debconf \
 curl libstdc++6:i386 lib32z1 -y

RUN apt-get update && apt-get upgrade -y
RUN apt-get clean

RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections

RUN echo steamcmd steamcmd/question select "I AGREE" | debconf-set-selections
RUN echo steamcmd steamcmd/license note '' | debconf-set-selections

RUN apt-get purge steam steamcmd
RUN mkdir steamcmd && cd steamcmd && ACCEPT_EULA=Y apt-get install -y --no-install-recommends steam steamcmd
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

RUN cd /home

RUN mkdir /server

# RUN steamcmd +force_install_dir /home/server +login anonymous +app_update 376030 +quit

COPY startup.sh /home/
RUN chmod 755 /home/startup.sh

ENV PATH="/home/servers:${PATH}"

WORKDIR /home

ENTRYPOINT ["/home/startup.sh"]









