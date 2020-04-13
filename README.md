# mjpeg-streamer-docker ![Docker](https://github.com/koseduhemak/mjpg-streamer-raspberrypi/workflows/Docker/badge.svg)

This Docker Image lets you run mjpg-streamer on the Raspberry Pi 4 (but it should also work on older RPIs).

I tested it with a Logitech C270 and it works.

### Run via CLI:
```bash
docker run -itd --rm --name mjpg-streamer --device /dev/video0:/dev/video0 -e "FPS=30" -e "RESOULTION=1280x720" -p 8080:8080 docker.pkg.github.com/koseduhemak/mjpg-streamer-raspberrypi/mjpg-streamer-raspberrypi:latest
```

### Run via docker-compose:
```yml
version: "3"
services:
  mjpg-streamer:
    restart: always
    image: docker.pkg.github.com/koseduhemak/mjpg-streamer-raspberrypi/mjpg-streamer-raspberrypi:latest
    environment:
      - FPS=30
      - RESOLUTION=1280x720
    devices:
      - /dev/video0:/dev/video0
    ports:
      - 8080:8080
```


### Variables
| Variables | Default value | Description |
|---|---|---|
| RESOLUTION | `1280x720` | Set the resolution of the camera. |
| FPS | `30` | Frames per second. | 
| INPUT_LIB | input_uvc.so | Input library which should be used. |
| INPUT_LIB | output_http.so | Output library which should be used. |

Package: https://github.com/koseduhemak/mjpg-streamer-raspberrypi/packages/181872
