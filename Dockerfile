# Start with official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install Python, pip, and Java (required for Tabula)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    openjdk11-jre \
    git

# Install Python libraries with --break-system-packages flag
RUN pip3 install --break-system-packages --no-cache-dir \
    tabula-py==2.8.2 \
    pandas==2.1.4 \
    openpyxl==3.1.2 \
    PyPDF2==3.0.1 \
    numpy==1.26.3

# Switch back to node user for security
USER node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]