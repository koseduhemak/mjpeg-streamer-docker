FROM alpine:3.11

RUN apk update

RUN apk add \
    cmake \
    imagemagick \
    libv4l-dev \
    libjpeg-dev \
    make