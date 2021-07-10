FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN  apt-get -qq update \
  && apt-get install -y python3 python3-pip wget curl bash git neofetch sudo software-properties-common ffmpeg \
  && apt install unzip \
  && rm -rf /var/lib/apt/lists/*

#Updating Libraries
RUN pip3 install -U pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

#Copying All Source
COPY . .

#Starting Bot
CMD ["bash", "start.sh"]
