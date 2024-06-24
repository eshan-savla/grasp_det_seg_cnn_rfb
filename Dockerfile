FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-devel
# Set timezone info
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install dependencies
# RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y git

WORKDIR /workspace/
# RUN git clone https://github.com/eshan-savla/grasp_det_seg_cnn_rfb.git && pip install -r grasp_det_seg_cnn_rfb/requirements.txt
# WORKDIR /workspace/grasp_det_seg_cnn_rfb/
CMD [ "bash" ]