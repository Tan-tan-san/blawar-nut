FROM python:3.9-slim

# Install necessary build tools and libcurl
RUN apt update && apt install -y \
    git \
    gcc \
    libcurl4-openssl-dev \
    libssl-dev \
    libffi-dev \
    && git clone https://github.com/blawar/nut.git /opt/nut \
    && pip install --no-cache-dir -r /opt/nut/requirements.txt \
    && apt remove -y git gcc libcurl4-openssl-dev libssl-dev libffi-dev \
    && apt autoremove -y && apt clean

WORKDIR /opt/nut

EXPOSE 9000
VOLUME ["/opt/nut/files"]

CMD ["python", "server.py"]
