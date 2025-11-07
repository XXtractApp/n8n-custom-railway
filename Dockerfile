# Start with official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install Python and minimal dependencies
# REMOVED: Java (openjdk11-jre, openjdk11-jdk) - not needed with pdfplumber
# REMOVED: Heavy build tools (g++, gcc, musl-dev) - not needed anymore
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    python3-dev

# Install Python libraries with --break-system-packages flag
# CHANGED: tabula-py → pdfplumber (no Java needed!)
# KEPT: All your other packages that are still useful
RUN pip3 install --break-system-packages --no-cache-dir \
    pdfplumber==0.10.3 \
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
