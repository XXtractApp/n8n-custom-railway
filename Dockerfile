# Start with official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install Python and minimal dependencies (NO Java needed!)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    python3-dev

# Install Python libraries with pdfplumber instead of tabula-py
RUN pip3 install --break-system-packages --no-cache-dir \
    pdfplumber==0.10.3 \
    pandas==2.1.4 \
    openpyxl==3.1.2 \
    PyPDF2==3.0.1 \
    numpy==1.26.3

# Create symlink so Python modules are accessible
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Expose n8n port
EXPOSE 5678
