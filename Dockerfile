FROM fedora:latest

RUN set -x && adduser \
  --home /home/latex \
  --uid 1000 \
  latex

RUN dnf update -y && dnf install -y \
  texlive-scheme-full \
  # some auxiliary tools
  wget git make openssh-clients python3-pip python3-dateutil python3-virtualenv \
  # markup format conversion tool
  pandoc pandoc-citeproc \
  # XFig utilities
  transfig \
  # syntax highlighting package
  python3-pygments && \
  # Remove more unnecessary stuff
  dnf clean all
