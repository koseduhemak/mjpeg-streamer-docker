# mjpeg-streamer-docker

This Docker Image lets you run mjpg-streamer on the Raspberry Pi 4 (but it should also work on older RPIs).

I tested it with a Logitech C270 and it works.

Run it:
```bash
docker run -itd --rm --name mjpg-streamer --device /dev/video0 -e "ENV_FPS=30" -e "ENV_RESOULTION=1280x720" -p 8080:8080 docker.pkg.github.com/koseduhemak/mjpg-streamer-raspberrypi/mjpg-streamer-raspberrypi:latest
```

or via docker-compose:

```yml
version: "3"
services:
  mjpg-streamer:
    restart: always
    image: docker.pkg.github.com/koseduhemak/mjpg-streamer-raspberrypi/mjpg-streamer-raspberrypi:latest
    environment:
      - ENV_FPS=30
      - ENV_RESOLUTION=1280x720
    devices:
      - /dev/video0
    ports:
      - 8080:8080
```
