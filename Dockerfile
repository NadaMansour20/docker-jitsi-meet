FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    JITSI_MEET_VERSION=latest

# Update and install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    openjdk-11-jre-headless \
    nginx \
    prosody \
    jitsi-meet \
    jibri && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/prosody.cfg.lua /etc/prosody/conf.avail/jitsi-meet.cfg.lua
COPY ./config/jibri.conf.json /etc/jitsi/jibri/config.json

# Expose necessary ports
EXPOSE 80 443 5222 5347 5280

# Start services
CMD ["/bin/bash", "-c", "service nginx start && service prosody start && /usr/bin/java -jar /opt/jitsi-meet/jitsi-meet.jar"]
