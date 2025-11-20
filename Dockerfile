FROM fedora:43
#FROM quay.io/fedora/fedora:43

RUN set -x && adduser --home /home/latex --uid 1000 latex

ENV PIP_ROOT_USER_ACTION=ignore

RUN dnf update -y \
  && dnf install -y wget git make openssh-clients findutils \
  java-latest-openjdk-headless lua libnsl \
  python3-pip python3-dateutil python3-pygments \
  pandoc transfig perl-File-Find perl-sigtrap perl-Time-HiRes perl-Unicode-Normalize which \
  libxcrypt-compat \
  && dnf clean all \
  && python -m pip install -U pip

COPY texlive.profile /

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  && mkdir -p install-tl \
  && tar -xvf install-tl-unx.tar.gz -C install-tl/ --strip-components=1 \
  && /install-tl/install-tl --profile /texlive.profile \
  && rm -rf /install-tl* \
  && tlmgr update --self --reinstall-forcibly-removed --all \
  && tlmgr remove --force tlcockpit latex2nemeth texplate

USER latex

