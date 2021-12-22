FROM ubuntu

WORKDIR /root/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
  apt-get --no-install-recommends --allow-unauthenticated -y install gpg dirmngr gpg-agent; \
  echo "deb http://ppa.launchpad.net/ocl-icd/ppa/ubuntu focal main " >> /etc/apt/sources.list; \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 593B02AF628BAFBF; \
  apt-get update -y; \
  apt-get upgrade -y; \
  apt-get --no-install-recommends --allow-unauthenticated -y install \
    make gcc libc6-dev git ca-certificates strace ocl-icd-libopencl1 ocl-icd-dev ocl-icd-opencl-dev; \
  cd /root; \
  git clone https://github.com/Oblomov/clinfo.git; \
  cd clinfo; \
  make; \
  make install


COPY debs /root/debs
RUN dpkg -i /root/debs/*.deb
