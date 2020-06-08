FROM kazakov/base

MAINTAINER Artem Kazakov <kazakov@gmail.com>

# default to being in the user's home directory

USER root

# Mono
RUN DEBIAN_FRONTEND="noninteractive" apt-get -qqy install tzdata
RUN apt-get -qq update && \
    apt-get -qqy install mono-complete

# Python
RUN apt-get -qq update && \
    apt-get -qqy install python

RUN apt-get -qq update && \
    apt-get -qqy install nodejs

USER powerless

WORKDIR /home/powerless
