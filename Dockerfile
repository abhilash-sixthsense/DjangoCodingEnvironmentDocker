FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    python3-dev \
    gcc \
    git \
    default-libmysqlclient-dev \
    pkg-config \
    build-essential \
    curl \
    vim 
RUN apt-get install  nginx -y
# RUN apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# Create a Python virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip
RUN pip install --upgrade pip
RUN pip install gunicorn
WORKDIR /app

CMD ["/bin/bash"]