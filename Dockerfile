FROM node

WORKDIR /usr/src

ENV DIMENSIONS_VERSION=v5.9.1
ENV DIMENSIONS_ZIP=Dimensions-v5.9.1.zip
ENV DIMENSIONS_CONFIG=https://bookadmin.ionego.net/config.js

COPY bootstrap.sh /usr/src/dimensions/bootstrap.sh

ADD https://github.com/popstarfreas/Dimensions/releases/download/$DIMENSIONS_VERSION/$DIMENSIONS_ZIP /usr/src/
RUN unzip $DIMENSIONS_ZIP -d /usr/src/dimensions && \
    rm $DIMENSIONS_ZIP

WORKDIR /usr/src/dimensions
RUN npm ci --only=production

EXPOSE 7777

ENTRYPOINT ["/bin/sh", "bootstrap.sh"]
