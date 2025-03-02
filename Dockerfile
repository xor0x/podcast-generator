FROM ubuntu:latest

# Combine RUN commands to reduce layers and ensure non-interactive installation
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install PyYAML with error handling flags
RUN pip3 install --upgrade pip && pip3 install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
