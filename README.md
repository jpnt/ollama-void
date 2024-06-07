# ollama-void

Container using Void Linux to serve an Ollama language model, resources are
managed declaratively at the container level using the `docker-compose.yml` file.

## How to use

(Work in progress...)

### Deploy

CPU only:

```sh
docker-compose up -d
```

or NVIDIA:
Requires: `nvidia-container-toolkit`

```sh
docker-compose --profile nvidia up -d
```

or AMD:

```sh
docker-compose --profile amd up -d
```

### Run

```sh
docker exec -it ollama_server_base ollama run llama3
```

More info:

https://hub.docker.com/r/ollama/ollama

---

## Enabling resource management

Resource limits are not supported and ignored on cgroups V1 rootless systems.

### Enabling cgroups V2

Depends on the Linux distribution, for Void Linux:

https://github.com/void-linux/void-runit/blob/master/rc.conf#L37
Uncomment the line with CGROUP_MODE=hybrid, and set it to unified.

---

## For podman users

### Docker compose

There is a `podman-compose` script available to process docker-compose.yml files.

### Docker hub

Append
`
[registries.search]
registries = ['docker.io']
`
to /etc/containers/registries.conf

### Rootless mode

WARNING: Rootless Podman relies on the unprivileged user namespace usage.

https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
