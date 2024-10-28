FROM ghcr.io/void-linux/void-glibc-busybox:latest

RUN xbps-install -Syu git bash gcc make cmake ccache

RUN git clone https://github.com/ggerganov/llama.cpp.git /opt/llama_cpp

WORKDIR /opt/llama_cpp
RUN cmake .
RUN make

EXPOSE 11434

ENTRYPOINT ["/bin/bash"]
#ENTRYPOINT ["llama_server", "--port", "11434"]
