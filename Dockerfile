FROM ghcr.io/void-linux/voidlinux-full:latest

RUN xbps-install -Syu \
    && xbps-install -y python3 python3-pip git

RUN git clone https://github.com/ollama/ollama.git /opt/ollama \
    && cd /opt/ollama \
    && python3 setup.py install

WORKDIR /opt/ollama

EXPOSE 11434

ENTRYPOINT ["python3", "ollama_server.py", "--port", "11434"]
