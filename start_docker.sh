#!/bin/bash
IMAGE_NAME="grasp_det_seg"
TAG="latest"

if docker ps -a --format '{{.Names}}' | grep -q "^$IMAGE_NAME$"; then
    echo "Container $IMAGE_NAME already exists. Restarting container"
    docker container start $IMAGE_NAME

else
    echo "Creating new container $IMAGE_NAME"
    docker run -it --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --network host \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="./:/workspace/grasp_det_seg_cnn_rfb:rw" \
    --privileged --shm-size=256m --gpus all \
    --name $IMAGE_NAME \
    $IMAGE_NAME:$TAG
fi