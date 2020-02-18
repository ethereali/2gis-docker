FROM i386/ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 69ECCC891636CC92 && \
    gpg --armor --export 69ECCC891636CC92 | apt-key add - && \
    echo 'deb http://deb.2gis.ru/ trusty non-free' | tee /etc/apt/sources.list.d/2gis.list && \
    apt-get update && apt-get -yy dist-upgrade && \
    apt-get -y --no-install-recommends install 2gis fontconfig libgl1-mesa-dri && \
    rm -rf /var/lib/apt/lists/* && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown 1000:1000 -R /home/developer

USER developer

ENV HOME /home/developer

CMD ["/bin/bash"]
