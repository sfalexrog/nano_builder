FROM debian

RUN apt-get update \
	&& apt-get install -y --no-install-recommends bc jq unzip wget parted apt-utils git ca-certificates gawk lsof gcc libc-dev libcap2-bin udev \
	&& apt-get clean

COPY ./scripts /builder/scripts
COPY ./bin /builder/bin
COPY ./src /builder/src

RUN gcc -static /builder/src/qemu-wrapper.c -O3 -s -o /builder/bin/qemu-wrapper

WORKDIR /builder
CMD /bin/bash

