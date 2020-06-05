#!/usr/bin/env bash

# Launches IntelliJ IDEA inside a Docker container

IMAGE=${1:-kazakov/intellij-local:latest}

DOCKER_GROUP_ID=$(cut -d: -f3 < <(getent group docker))
USER_ID=$(id -u $(whoami))
GROUP_ID=$(id -g $(whoami))
HOME_DIR=$(cut -d: -f6 < <(getent passwd ${USER_ID}))

# Need to give the container access to your windowing system
xhost local:+

# map as user so that we have access
CMD="docker run --group-add ${DOCKER_GROUP_ID} \
                --env DISPLAY=unix${DISPLAY} \
                --interactive \
                --name IntelliJ \
                --net "host" \
                --rm \
                --tty \
                --user=${USER_ID}:${GROUP_ID} \
                --volume ${HOME}/.Idea:${HOME}/.Idea
                --volume ${HOME}/.java:${HOME}/.java
                --volume ${HOME}/.IdeaIC2019.3:${HOME}/.IdeaIC2019.3
                --volume ${HOME}/.Idea.share:${HOME}/.Idea.share
                --volume /etc/group:/etc/group:ro \
                --volume /etc/passwd:/etc/passwd:ro \
                --volume /tmp/.X11-unix:/tmp/.X11-unix \
                --volume /var/run/docker.sock:/var/run/docker.sock \
                --workdir ${HOME} \
                ${IMAGE}"

echo $CMD
$CMD
