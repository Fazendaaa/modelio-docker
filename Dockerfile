FROM jlesage/baseimage-gui:ubuntu-22.04-v4.5.3

WORKDIR /usr/src/

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes \
  curl \
  dbus-x11 \
  locales \
  libatk1.0-0 \
  libgtk-3-0 \
  libglib2.0-dev \
  libwebkit2gtk-4.0-37 \
  libwebkitgtk-6.0-4 \
  wget
RUN sed-patch 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  locale-gen

ENV LANG="en_US.UTF-8"

COPY downloadGithub.sh .

RUN chmod +x downloadGithub.sh
RUN ./downloadGithub.sh

COPY startapp.sh /startapp.sh

RUN chmod +x /startapp.sh

RUN set-cont-env APP_NAME "modelio"
