FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    lib32z1 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://archive.org/download/jdk-6u45/jdk-6u45-linux-i586.bin \
    && chmod +x jdk-6u45-linux-i586.bin \
    && ./jdk-6u45-linux-i586.bin \
    && mkdir -p /usr/lib/jvm \
    && mv jdk1.6.0_45 /usr/lib/jvm/ \
    && rm jdk-6u45-linux-i586.bin

RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_45/bin/java 1
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_45/bin/javac 1
RUN update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/jdk1.6.0_45/bin/javah 1
RUN update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws 1
RUN update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.6.0_45/bin/jar 1

RUN java -version 2>&1 | grep 'java version "1.6.0_45"'
