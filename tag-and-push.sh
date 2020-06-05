#!/bin/bash

# use the time as a tag
UNIXTIME=$(date +%s)

# docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
docker tag kazakov/intellij-local:latest kazakov/docker-intellij:latest
docker tag kazakov/intellij-local:latest kazakov/docker-intellij:${UNIXTIME}
docker images

# Usage:  docker push [OPTIONS] NAME[:TAG]
docker push kazakov/docker-intellij:latest
docker push kazakov/docker-intellij:${UNIXTIME}

