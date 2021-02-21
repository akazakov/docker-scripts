#!/usr/bin/env bash

set -eu

# Launches IntelliJ IDEA inside a Docker container

IMAGE=${1:-kazakov/intellij-local:latest}

#DOCKER_GROUP_ID=$(cut -d: -f3 < <(getent group docker))
USER_ID=$(id -u $(whoami))
GROUP_ID=$(id -g $(whoami))
DOCKER_HOME=/home/powerless

                #-v /tmp/.X11-unix:/tmp/.X11-unix \
                #-v /var/run/docker.sock:/var/run/docker.sock \
		#--user ${USER_ID}:${GROUP_ID} \
		#--entrypoint /bin/bash \
CMD="docker run --env DISPLAY=host.docker.internal:0 \
	--interactive \
	--name IntelliJ \
	--net "host" \
	--rm \
	--tty \
	-v ${HOME}/.Idea:${DOCKER_HOME}/.Idea:delegated \
	-v cache:${DOCKER_HOME}/.cache \
	-v ${HOME}/.java:${DOCKER_HOME}/.java:delegated \
	-v ${HOME}/projects:${DOCKER_HOME}/projects:delegated \
	-v ${HOME}/.Idea.share:${DOCKER_HOME}/.Idea.share:delegated \
	-v ${HOME}/.IdeaIC2019.3:/home/powerless/.IdeaIC2019.3:delegated \
	--env HOME=${DOCKER_HOME} \
	--workdir ${DOCKER_HOME} \
	${IMAGE}"

echo $CMD
$CMD
