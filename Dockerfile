FROM ubuntu
RUN apt-get update
RUN apt-get -y install sudo -y
RUN apt-get install -my wget gnupg -y
RUN apt-get install lsb-release -y
RUN apt-get install git -y
RUN apt-get install openssl -y
RUN apt-get install curl -y
RUN apt-get install wget -y

RUN AZ_REPO=$(lsb_release -cs)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893 && \
    apt-get install apt-transport-https && apt-get update && apt-get install azure-cli
RUN az aks install-cli