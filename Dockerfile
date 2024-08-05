# syntax=docker/dockerfile:1.3-labs

FROM python:3.11-slim

ARG DEBIAN_FRONTEND="noninteractive"

# Pip install first to cache the environment layer
COPY requirements.txt /api/

RUN <<EOF
set -e
python3 -m pip install --no-cache-dir -r /api/requirements.txt
EOF

# Copy the code layer
ADD __api.tar.gz /api
WORKDIR /api

# Add default startup command
CMD ["bash", "start.sh"]
