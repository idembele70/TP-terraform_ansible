FROM ubuntu:20.04

WORKDIR /app
COPY . /app

## Set the timezone to avoid user interaction during docker run command !
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris
RUN apt-get update && apt-get install -y \
    tzdata software-properties-common ansible python3 python3-pip ssh curl wget git iputils-ping && \
    ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata


RUN chmod +x /app/deploy.sh

CMD ["./deploy.sh"]
