# Dockerfile
FROM python:3.9-slim

# Install dependencies
RUN apt update && apt install -y git && \
    git clone https://github.com/blawar/nut.git /opt/nut && \
    pip install --no-cache-dir -r /opt/nut/requirements.txt && \
    apt remove -y git && apt autoremove -y && apt clean

# Set working directory
WORKDIR /opt/nut

# Expose Nut's default port
EXPOSE 9000

# Nut will serve files from ./files/
VOLUME ["/opt/nut/files"]

# Start Nut server
CMD ["python", "server.py"]
