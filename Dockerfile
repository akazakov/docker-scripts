FROM kazakov/grpc

MAINTAINER Artem

ENTRYPOINT ["/opt/idea/bin/idea.sh"]

USER root

ADD https://download.jetbrains.com/idea/ideaIC-2019.3.5.tar.gz /tmp/arch-idea.tar.gz

# default to being in the user's home directory
WORKDIR /home/powerless

RUN tar --extract --verbose --directory /tmp --file /tmp/arch-idea.tar.gz
RUN mv /tmp/idea* /opt/idea
RUN rm -f /tmp/arch-idea.tar.gz

USER powerless
