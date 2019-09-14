FROM multiarch/debian-debootstrap:armhf-buster

RUN apt-get update \
    && apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

RUN add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update \
    && apt-get install docker-ce docker-ce-cli containerd.io