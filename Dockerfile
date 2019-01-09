FROM alpine
MAINTAINER Ash McKenzie <ash@the-rebellion.net>
ENV ADG_VERSION v0.92-hotfix1

VOLUME /data

RUN apk update && apk add bash curl ca-certificates wget tar
RUN wget https://github.com/AdguardTeam/AdGuardHome/releases/download/${ADG_VERSION}/AdGuardHome_${ADG_VERSION}_linux_amd64.tar.gz
RUN tar xvzf AdGuardHome_${ADG_VERSION}_linux_amd64.tar.gz

ADD start.sh /
ADD data/ /data/
ADD AdGuardHome/ /app/

WORKDIR /data

CMD "/start.sh"
