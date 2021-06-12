FROM ubuntu:20.04

WORKDIR /root

COPY setup setup
COPY setup.sh setup.sh

ENV DEBIAN_FRONTEND="noninteractive"

# we set TERM to avoid losing p10k's colored frame
ENV TERM="xterm-256color"

RUN sh setup.sh

COPY monitoring .bin/monitoring
