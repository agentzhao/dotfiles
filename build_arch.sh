#!/bin/bash
TODAY=$(date +"%Y-%m-%d")
docker build . -t agentzhao/arch-linux && \
docker tag agentzhao/arch-linux "agentzhao/arch-linux:$TODAY" && \
docker push agentzhao/arch-linux -a
