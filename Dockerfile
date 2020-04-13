FROM alpine:3.11
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-armhf.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-armhf.tar.gz -C /


RUN apk update

RUN apk add \
    build-base \
    cmake \
    git \
    linux-headers \
    imagemagick \
    v4l-utils-dev \
    jpeg-dev \
    make

# Download from repository
WORKDIR /tmp
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git

WORKDIR /tmp/mjpg-streamer/mjpg-streamer-experimental/

# Make
RUN make && \
    make install

ENTRYPOINT ["/init"]
