FROM fedora:latest

RUN set -x && adduser \
  --home /home/latex \
  --uid 1000 \
  latex

RUN dnf update -y && dnf install -y \
  wget git make openssh-clients findutils \
  java-11-openjdk-headless lua \
  python3-pip python3-dateutil \
  pandoc pandoc-citeproc transfig python3-pygments && \
  dnf clean all

COPY texlive.profile /

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
  mkdir -p install-tl && \
  tar -xvf install-tl-unx.tar.gz -C install-tl/ --strip-components=1 && \
  /install-tl/install-tl --profile /texlive.profile && \
  rm -rf /install-tl* && \
  tlmgr update --self --reinstall-forcibly-removed --all
