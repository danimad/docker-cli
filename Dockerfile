# Based on:
#   Data Science at the Command Line
# docker image by:
#   Jeroen Janssens <jeroen@datascienceworkshops.com>

FROM alpine:latest
# LABEL maintainer "Daniel Berecz"

RUN apk update

RUN apk --no-cache add \
    arpack-dev \
    bash \
    bash-doc \
    bc \
    bc-doc \
    cmake \
    coreutils \
    coreutils-doc \
    curl \
    curl-doc \
    curl-dev \
    findutils \
    findutils-doc \
    font-adobe-100dpi \
    gcc \
    g++ \
    git \
    git-doc \
    gnuplot \
    grep \
    grep-doc \
    groff \
    jpeg-dev \
    jq \
    jq-doc \
    less \
    less-doc \
    libxml2-dev \
    man \
    man-pages \
    mdocml-apropos \
    nodejs \
    nodejs-npm \
    neovim \
    p7zip \
    p7zip-doc \
    parallel \
    parallel-doc \
    perl-dev \
    py-lxml \
    py-pip \
    python3 \
    python3-dev \
    sed \
    sed-doc \
    sudo \
    sudo-doc \
    tar \
    tar-doc \
    tmux \
    tree \
    tree-doc \
    the_silver_searcher \
    unrar \
    unrar-doc \
    unzip \
    unzip-doc \
    wget \
    xmlstarlet \
    xmlstarlet-doc \
    xterm \
    zsh

# Update python based packages
RUN easy_install-3.6 pip && \
    pip install --upgrade pip && \
    pip install \
    awscli \
    csvkit \
    nose \
    neovim

RUN pip2 install --upgrade pip && \
    pip2 install cssselect

# Update JS based packages
RUN npm install -g \
    cowsay \
    json2csv \
    xml2json-command

# create user
# from: https://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/
RUN adduser -S -g /bin/bash dev
RUN mkdir -p /home/dev && chown -R dev: /home/dev
RUN mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH

WORKDIR /home/dev
ENV HOME /home/dev

ADD root/ /home/dev/
# Neovim setup
# RUN mkdir -p ~/.config/nvim/bundle

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# RUN nvim +PluginInstall +UpdateRemotePlugins +qall

# Install Oh My Zsh
RUN curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# Download tools from the DSatCL book's repo
# RUN cd /tmp && \
#     git clone https://github.com/jeroenjanssens/data-science-at-the-command-line.git && \
#     cp -v data-science-at-the-command-line/tools/* /usr/bin/

# RUN curl -sL http://bitbucket.org/eigen/eigen/get/3.2.9.tar.gz > /tmp/eigen.tar.gz && \
#     cd \tmp && \
#     mkdir eigen && tar -xzvf eigen.tar.gz -C eigen --strip-components=1 && \
#     cd eigen && \
#     mkdir build && cd build && cmake .. && make && make install

# RUN cd /tmp && \
#     git clone https://github.com/lisitsyn/tapkee.git && \
#     cd tapkee && mkdir build && cd build && cmake .. && make && \
#     cp -v /tmp/tapkee/bin/tapkee /usr/bin

# RUN yes | cpan List::MoreUtils && \
#     git clone https://github.com/dkogan/feedgnuplot.git && \
#     cd feedgnuplot && \
#     perl Makefile.PL && \
#     make && \
#     make install && \
#     cd .. && \
#     rm -r feedgnuplot

# RUN export GOPATH=/usr && \
#     go get github.com/ericchiang/pup

RUN rm -rf /tmp/* /var/cache/apk/*

# RUN echo "export PAGER='less'" >>~/.bashrc && \
#     echo "alias l='ls -lph --group-directories-first'" >>~/.bashrc && \
#     echo "export PS1='\[\033[38;5;6m\][\w]$\[\033[38;5;15m\] '" >>~/.bashrc

RUN chown -R dev: /home/dev
USER dev

WORKDIR /home/dev

CMD zsh

# ENTRYPOINT /bin/zsh
