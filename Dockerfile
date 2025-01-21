FROM ubuntu:latest

LABEL maintainer="dotup.de <dotup.software@gmail.com>"
LABEL repository="https://github.com/compose-docker/docker-activitywatch"

RUN mkdir /app
WORKDIR /app

RUN apt-get -qq -y update \
  && apt-get install -qq -y --no-install-recommends ca-certificates unzip wget \
  && wget -q -O - https://github.com/ActivityWatch/activitywatch/releases/download/v0.13.2/activitywatch-v0.13.2-linux-x86_64.zip
  && unzip ./activitywatch*.zip \
  && rm ./activitywatch*.zip \
  && chmod +x ./activitywatch/aw-server \
  && apt-get purge -qq -y --auto-remove ca-certificates unzip wget

EXPOSE 5600
SHELL ["/bin/bash", "-c"]
CMD ["/app/activitywatch/aw-server", "--host", "0.0.0.0"]
