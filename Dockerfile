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
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
RUN sudo apt-get install apt-transport-https
RUN sudo apt-get update && sudo apt-get install azure-cli
RUN az aks install-cli