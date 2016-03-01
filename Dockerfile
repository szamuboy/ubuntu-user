FROM ubuntu:15.10

MAINTAINER Gergely Szabo

ARG devuser=user
ARG devuserid=1001
ARG devgroupid=1001
ARG gitusername=user
ARG gituseremail=user@not.set

ENV SHELL /bin/bash
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV HOME /home/${devuser}
ENV TERM xterm-256color
ENV PATH /home/${devuser}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8                                  && \
    apt-get -y update                                       && \
    apt-get -y upgrade                                      && \
    apt-get install -y sudo git

RUN groupadd -g ${devgroupid} ${devuser}                    && \
    useradd -m -u ${devuserid} -g ${devuser} -G sudo ${devuser}             && \
    echo "${devuser}:${devuser}" | chpasswd               

WORKDIR /home/$devuser
USER $devuser

RUN mkdir /home/${devuser}/.ssh                  && \
    chmod go-rx /home/${devuser}/.ssh            
ADD id_rsa /home/egersza/.ssh/id_rsa

RUN mkdir /home/${devuser}/bin                                                   
RUN git config --global user.name "${gitusername}"                               && \
    git config --global user.email "${gituseremail}"            

USER root
RUN chown -R ${devuser}:${devuser} /home/${devuser}

USER $devuser
CMD ["/bin/bash"]
