# 2gis-docker
Dockerfile for 2gis

https://hub.docker.com/r/ethereali/2gis

run with command

docker run -it --net host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ethereali/2gis 2gis
