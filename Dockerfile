FROM ubuntu:trusty

MAINTAINER Ivan Smirnov <i.s.smirnov@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y pandoc texlive-latex-base texlive-xetex latex-xcolor \
    texlive-math-extra texlive-latex-extra texlive-fonts-extra curl wget tex-gyre \
    fonts-oflb-asana-math fontconfig git python-setuptools

RUN easy_install pip && \
    pip install flask requests py && \
    mkdir -p /tmp && cd /tmp && \
    git clone https://github.com/aldanor/pandocr.git && \
    cd /tmp/pandocr && python setup.py install

RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/dpkgs /var/lib/cache /var/lib/log /tmp/* /var/tmp/*

WORKDIR /
EXPOSE 8585

ENTRYPOINT ["pandocr-server", "--host", "0.0.0.0", "--port", "8585"]
