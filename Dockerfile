FROM jpetazzo/dind

# use aarnet mirror for quicker building while developing
RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

# install baseline package dependencies
RUN apt-get -y update
RUN apt-get install -y curl wget software-properties-common build-essential git

# rebuild
ADD Makefile /tmp/builder/
ADD base /tmp/builder/base/
ADD chrome /tmp/builder/chrome/
