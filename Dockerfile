# Start with official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install Python, Java, git, and build tools (needed for jpype1)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    openjdk11-jre \
    openjdk11-jdk \
    git \
    g++ \
    gcc \
    musl-dev \
    python3-dev

# Install Python libraries with --break-system-packages flag
RUN pip3 install --break-system-packages --no-cache-dir \
    tabula-py==2.8.2 \
    pandas==2.1.4 \
    openpyxl==3.1.2 \
    PyPDF2==3.0.1 \
    numpy==1.26.3

# DON'T switch back to node user - let the entrypoint handle it
# USER node <-- REMOVED

# Expose n8n port
EXPOSE 5678
