FROM ubuntu:bionic

MAINTAINER Artem Kazakov <kazakov@gmail.com>

USER root

# Create non-root user -- many systems default to 1000 so we'll do that here to make things compatible
RUN groupadd --system powerless --gid 1000 && \
    useradd --uid 1000 --system --gid powerless --home-dir /home/powerless --create-home --shell /sbin/nologin --comment "Docker image user" powerless && \
    chown -R powerless:powerless /home/powerless

RUN apt-get -qq update && \
    apt-get -qqy install curl git gnupg2 g++ unzip zip

RUN apt-get -qq update && \
    apt-get -qqy install openjdk-8-jdk

RUN apt-get -qq update && \
    apt-get -qqy install libgnomevfs2-0 libsecret-1-0 gnome-keyring

RUN apt-get -qq update && \
    apt-get -qqy install vim

# Bazel
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt-get -qq update && \
    apt-get -qqy install bazel

RUN apt-get -qq update && \
    apt-get -qqy full-upgrade

# Intellij IDEA
ADD https://download.jetbrains.com/idea/ideaIC-2019.3.5.tar.gz /tmp/arch-idea.tar.gz
RUN tar --extract --verbose --directory /tmp --file /tmp/arch-idea.tar.gz
RUN mv /tmp/idea* /opt/idea
RUN rm -f /tmp/arch-idea.tar.gz


# default to being in the user's home directory
WORKDIR /home/powerless

ENTRYPOINT ["/opt/idea/bin/idea.sh"]

USER powerless
