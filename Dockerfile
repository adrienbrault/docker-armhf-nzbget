FROM resin/rpi-raspbian:jessie-2015-09-02

MAINTAINER Adrien Brault <adrien.brault@gmail.com>

RUN apt-get update -qy && \
    apt-get install wget -qy && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -nv -O unrar.deb https://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1_armhf.deb && \
    dpkg -i unrar.deb && \
    rm unrar.deb

RUN wget -nv -O nzbget-install https://github.com/nzbget/nzbget/releases/download/v15.0/nzbget-15.0-bin-linux.run && \
    sh nzbget-install && \
    rm nzbget-install

ADD start.sh /start.sh
RUN chmod u+x /start.sh

VOLUME ["/downloads", "/config"]
EXPOSE 6789

CMD ["/start.sh"]
