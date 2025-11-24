# Karla Daley
# CTF challenge
# PCAP, Network, Crypto, Exif, Zip


FROM ubuntu:22.04
LABEL maintainer="Karla Daley <kdaley2024@my.fit.edu>"

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/ctf

# -------------------------------------------------
# Packages
# -------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash vim nano curl wget netcat iputils-ping traceroute nmap \
      tcpdump tshark unzip zip gcc gdb python3 python3-pip git sudo \
      build-essential man-db socat && \
    rm -rf /var/lib/apt/lists/*

# --------------------------------------------------------
# Install system dependencies
# --------------------------------------------------------
RUN apt-get update && apt-get install -y \
    zip unzip openssl steghide \
    build-essential \
    binwalk \
    binutils \
    tshark tcpdump wireshark-common \
    wireshark \
    python3 \
    python3-pip \
    git \
    foremost \
    python3-dev \
    python3-bandit \
    python3-scapy \
    sudo \
    whois \
    curl \
    exiftool \
    apache2 \
    ghostscript \
    enscript \
    libssl-dev \
    libffi-dev \
    python3-venv \
    python3-distutils \
    php libapache2-mod-php \
    imagemagick libimage-exiftool-perl \
    xxd git vim less curl wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and setuptools
RUN pip3 install --upgrade pip setuptools wheel

# --------------------------------------------------
# Overview
# --------------------------------------------------
RUN mkdir -p /opt/ctf/
RUN printf '%s\n' \
  '  Welcome to the CTF Challenge Environment!' \
  '  You will be given a series of challenges to test your skills in network analysis, cryptography, and more.' \
  '  Each challenge is located in its own directory under /opt/ctf/.' \
  '  Good luck and have fun!' \
  > /opt/ctf/README.txt

# -------------------------------------------------
# PCAP Challenge
# -------------------------------------------------

RUN mkdir -p /opt/ctf/pcap
#COPY ./pcap/suspicious.pcap /opt/ctf/pcap/suspicious.pcap
RUN printf '%s\n' \
  '  Goal: Analyze the provided PCAP file to uncover hidden messages and extract the secret flag.' \
  '  Open the suspicious.pcap file using Wireshark or tshark or any other packet analysis tool.' \
  '  Look for unusual traffic patterns, hidden data within packets, or encoded messages.' \
  > /opt/ctf/pcap/README.txt

RUN printf '%s\n' '  Hint: Focus on UDP packets and look for any anomalies in the payloads.' \
  > /opt/ctf/pcap/.hint.txt

RUN printf '%s \n' '⠓⠚⠀⠊⠋⠀⠊⠋⠀⠊⠉⠀⠊⠑⠀⠑⠇⠀⠙⠧⠀⠙⠧⠀⠓⠋⠀⠊⠙⠀⠓⠅⠀⠊⠓⠀⠓⠛⠀⠙⠥⠀⠓⠊⠀⠓⠧⠀⠓⠧⠀⠓⠊⠀⠓⠗⠀⠓⠛⠀⠙⠥⠀⠓⠑⠀⠓⠧⠀⠓⠞⠀⠙⠧⠀⠓⠓⠀⠓⠅⠀⠓⠗⠀⠓⠛⠀⠙⠧⠀⠓⠋⠀⠙⠧⠀⠑⠃⠀⠑⠊⠀⠓⠚⠀⠓⠞⠀⠋⠧⠀⠓⠑⠀⠋⠇⠀⠓⠇⠀⠛⠃⠀⠑⠛⠀⠑⠉⠀⠊⠑⠀⠛⠃⠀⠑⠑⠀⠓⠇⠀⠓⠙⠀⠊⠙⠀⠊⠛⠀⠋⠋⠀⠓⠃⠀⠋⠗⠀⠋⠚⠀⠛⠃⠀⠛⠑⠀⠊⠇⠀⠊⠉⠀⠓⠃⠀⠊⠓⠀⠑⠋⠀⠑⠚⠀⠑⠅⠀⠑⠃⠀⠋⠋⠀⠙⠧⠀⠊⠓⠀⠓⠅⠀⠓⠛⠀⠊⠊⠀⠑⠧⠀⠊⠛⠀⠊⠑⠀⠊⠉⠀⠑⠞⠀⠓⠋⠀⠊⠙⠀⠓⠅⠀⠊⠓⠀⠓⠛⠀⠛⠧⠀⠓⠗⠀⠓⠅⠀⠓⠥⠀⠓⠝' \
  > /opt/ctf/pcap/pcap.txt
  
# -------------------------------------------------
# NETWORK Challenge
# -------------------------------------------------
RUN mkdir -p /opt/ctf/network
RUN printf '%s\n' \
  '  Goal: Investigate the network configuration and traffic to identify misconfigurations or vulnerabilities.' \
  '  Examine network settings, open ports, and running services.' \
  '  Look for any unusual activity or potential security issues that could lead to the flag.' \
  > /opt/ctf/network/README.txt

# -------------------------------------------------
# CRYPTO Challenge
# -------------------------------------------------

RUN mkdir -p /opt/ctf/crypto
RUN printf '%s\n' \
  '  Goal: Decrypt the provided ciphertext to reveal the hidden message and extract the flag.' \
  '  You will find an encrypted file in this directory.' \
  '  Use your cryptographic skills to determine the encryption method and retrieve the original message.' \
  > /opt/ctf/crypto/README.txt

# -------------------------------------------------
# EXIF + ZIP Challenge
# -------------------------------------------------

RUN mkdir -p /opt/ctf/exif

