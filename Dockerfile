FROM debian:jessie
# Install Epics
RUN apt-get update
RUN apt-get install git libreadline-dev libtinfo-dev readline-common wget vim -y
RUN apt-get install libreadline6-dev libncurses5-dev gcc g++ -y
RUN apt-get install libx11-dev liblapack-dev libmotif-dev libfontconfig1-dev -y
RUN apt-get install libxaw7-dev libgif-dev -y
RUN apt-get install curl libcurl4-gnutls-dev libxerces-c-dev libusb-dev flex -y
RUN apt-get install make -y
RUN mkdir /usr/local/epics
WORKDIR /usr/local/epics
RUN wget https://epics.anl.gov/download/base/base-3.15.5.tar.gz
RUN tar -xzf base-3.15.5.tar.gz
RUN rm -fv /usr/local/epics/base-3.15.5.tar.gz
RUN wget https://svn.lnls.br/SOL/epics/config/epics.sh --no-check-certificate
RUN arch | xargs -i@ sed -i 's/linux-x86/linux-@/g' epics.sh
RUN mv -v /usr/local/epics/epics.sh /etc/profile.d/
RUN ln -s /usr/local/epics/base-3.15.5 base
RUN arch | xargs -i@ echo "/usr/local/epics/base/lib/linux-@" > /etc/ld.so.conf.d/epics.conf
RUN ldconfig
RUN sed -i '/epicsAssert.h/a \#include "stddef.h"' /usr/local/epics/base/src/libCom/cxxTemplates/epicsSingleton.h
WORKDIR /usr/local/epics/base-3.15.5
RUN make

CMD bash
