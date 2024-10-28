# Void AI Container

Void-AI-CTR is a containerized solution for deploying a fast and local Large Language Model (LLM) using the latest best open-source technologies. This project aims to provide a simple and efficient way to run a local LLM server on Void Linux.

## Features

* Uses the latest llama.cpp implementation for high-performance LLM inference
* Supports CPU, NVIDIA GPU, and AMD GPU acceleration
* Declarative resource management using Docker Compose
* Void Linux glibc with busybox, optimized for minimal size and maximum compatibility

## Getting Started

### Prerequisites

* Docker and Docker Compose installed on your system
    * Alternatively, you can use Podman and Podman Compose
* NVIDIA GPU support requires the `nvidia-container-toolkit` package

### Deployment

To deploy the Void-AI-CTR container, follow these steps:

1. Clone this repository: `git clone https://github.com/jpnt/void-ai-ctr.git`
2. Navigate to the project directory: `cd void-ai-ctr`
3. Deploy the container using Docker Compose:
    * CPU only: `docker-compose up -d`
    * NVIDIA GPU: `docker-compose --profile nvidia up -d`
    * AMD GPU (NOT TESTED): `docker-compose --profile amd up -d`

### Running the LLM Server

To run the LLM server, run the following command:

```sh
docker exec -it void_ai_ctr_base llama-cpp run llama3
```

---

## Resource Management

Void-AI-CTR uses declarative resource management with Docker Compose. However, please note that resource limits are not supported and ignored on cgroups V1 rootless systems.

To enable cgroups V2 on Void Linux, follow these steps:

1. Edit the `/etc/void-runit/rc.conf` file
2. Uncomment the line with `CGROUP_MODE=hybrid` and set it to `unified`

---

## Podman Users

If you're using Podman, you can use the `podman-compose` script to process Docker Compose files.

To enable Docker Hub support, append the following lines to `/etc/containers/registries.conf`:

```ini
[registries.search]
registries = ['docker.io']
```

Please note that rootless Podman relies on unprivileged user namespace usage.
For more information, refer to the [Podman rootless tutorial](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md).
