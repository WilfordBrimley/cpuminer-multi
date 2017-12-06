#
# Dockerfile for cpuresearch
# usage: docker run creack/cpuresearch --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/cpuresearch --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM		ubuntu:12.10
MAINTAINER	Guillaume J. Charmes <guillaume@charmes.net>

RUN		apt-get update -qq

RUN		apt-get install -qqy automake
RUN		apt-get install -qqy libcurl4-openssl-dev
RUN		apt-get install -qqy git
RUN		apt-get install -qqy make

RUN		git clone https://github.com/pooler/cpuresearch

RUN		cd cpuresearch && ./autogen.sh
RUN		cd cpuresearch && ./configure CFLAGS="-O3"
RUN		cd cpuresearch && make

WORKDIR		/cpuresearch
ENTRYPOINT	["./cpuresearch"]
