FROM fedora:latest

RUN set -x && adduser \
  --home /home/latex \
  --uid 1000 \
  latex

RUN dnf update -y && dnf install -y \
  wget git make openssh-clients find \
  java-11-openjdk-headless lua \
  python3-pip python3-dateutil python3-virtualenv \
  pandoc pandoc-citeproc transfig python3-pygments && \
  dnf clean all

COPY texlive.profile /

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
  mkdir -p install-tl && \
  tar -xvf install-tl-unx.tar.gz -C install-tl/ --strip-components=1 && \
  /install-tl/install-tl --profile /texlive.profile && \
  rm -rf /install-tl* && \
  /usr/local/texlive/2020/bin/x86_64-linux/tlmgr path add && \
  tlmgr update --self --reinstall-forcibly-removed --all
