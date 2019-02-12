FROM debian:jessie
# Install Epics
RUN apt-get update
RUN apt-get install wget libreadline-dev libtinfo-dev readline-common  libreadline6-dev libncurses5-dev gcc g++ make perl-modules -y

RUN mkdir /usr/local/epics
WORKDIR /usr/local/epics
RUN wget https://epics.anl.gov/download/base/base-3.15.6.tar.gz
RUN tar -xzf base-3.15.6.tar.gz
RUN rm -fv /usr/local/epics/base-3.15.6.tar.gz
RUN ln -s /usr/local/epics/base-3.15.6 base
WORKDIR /usr/local/epics/base-3.15.6
RUN make

WORKDIR /usr/local/epics
COPY epics.sh .
RUN arch | xargs -i@ sed -i 's/linux-x86/linux-@/g' epics.sh
RUN mv -v /usr/local/epics/epics.sh /etc/profile.d/
RUN echo ". /etc/profile.d/epics.sh" >> /etc/bash.bashrc
RUN arch | xargs -i@ echo "/usr/local/epics/base/lib/linux-@" > /etc/ld.so.conf.d/epics.conf
RUN ldconfig


CMD bash
