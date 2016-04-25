FROM debian:jessie
MAINTAINER  Alexandre Buisine <alexandrejabuisine@gmail.com>
LABEL version "1.0.0"

# Update the package repository and install applications
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get -yqq install \
	git \
	make \
	build-essential \
	curl \
	genisoimage \
	liblzma-dev \
	binutils-dev \
	zlib1g-dev \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 git://git.ipxe.org/ipxe.git /ipxe

WORKDIR /ipxe/src
CMD ["make"]