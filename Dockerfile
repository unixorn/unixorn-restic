FROM debian:13-slim

ARG application_version
LABEL maintainer="Joe Block <jpb@unixorn.net>"
LABEL version=${application_version}

RUN apt-get update
RUN apt-get install -y apt-utils ca-certificates restic --no-install-recommends
RUN update-ca-certificates
