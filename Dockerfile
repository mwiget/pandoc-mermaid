FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y -q \
  texlive-latex-base \
  texlive-fonts-recommended \
  texlive-latex-extra \
  texlive-xetex \
  python3-pip \
  libx11-xcb-dev \
  libxcomposite-dev \
  libxcursor-dev \
  libxdamage-dev \
  libxtst-dev \
  libxss-dev \
  libxrandr-dev \
  libasound-dev \
  libatk1.0-dev \
  libatk-bridge2.0-dev \
  libpango1.0-dev \
  libgtk-3-dev \
  wget \
  && wget -O- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y -q yarn \
  && apt-get -y -q autoremove \
  && rm -rf /var/lib/apt/lists/

RUN pip3 install panflute

RUN ln -sf /node_modules/.bin/mmdc /usr/bin/mmdc

RUN wget https://github.com/jgm/pandoc/releases/download/2.9.1/pandoc-2.9.1-linux-amd64.tar.gz \
  && tar zxf pandoc-2.9.1-linux-amd64.tar.gz \
  && mv pandoc-2.9.1/bin/* /usr/bin/

RUN yarn add mermaid mermaid.cli 

VOLUME /u
WORKDIR /u
