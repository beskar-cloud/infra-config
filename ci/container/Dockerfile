FROM debian:11.5
LABEL version="0.4.0"

ENV ANSIBLE_VERSION=2.13.2
ENV ANSIBLELINT_VERSION=6.5.2


RUN apt-get update
RUN apt-get install -y python3-pip iputils-ping htop mtr git nano vim jq bsdmainutils

# segment_viewer
RUN apt-get install -y ruby ruby-dev libncurses5-dev libncursesw5-dev
RUN gem install curses pmap

ENV PATH="${PATH}:/root/.local/bin"


RUN python3 -m pip install --user ansible-core==${ANSIBLE_VERSION}
RUN python3 -m pip install --user ansible-lint==${ANSIBLELINT_VERSION} dnspython
RUN ansible-galaxy collection install ansible.posix community.general

ENV PATH="${PATH}:/root/.local/bin"

WORKDIR /root/repo
