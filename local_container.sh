PROJECT_NAME=algo-source-dev

# docker build  -t ${PROJECT_NAME}-image   .
# AlgoSource
# Run container on Windows with SSH connection to GitHub already configured
winpty docker run --rm -it \
--env-file ./.env \
--mount type=bind,source="$(PWD)",target=/root/AlgoSource \
--mount type=bind,source="$HOME/.ssh",target=/root/.ssh \
--mount  type=bind,source="$HOME/.gitconfig",target=/etc/gitconfig \
--name ${PROJECT_NAME}-container \
-p 8031:8031 \
--entrypoint bash \
${PROJECT_NAME}-image 

winpty docker exec -it ${PROJECT_NAME}-container bash