# Triggermesh Quick Start

Quickly install Triggermesh on a fresh cluster for development and testing purposes, and then get up to speed with a step-by-step introduction to the individual Triggermesh components.

## Docker Desktop
### Prerequisites

- Docker Desktop with Kubernetes enabled.

### Install Triggermesh
Clone or download this repository.

Open a terminal within the `./Install/DockerDesktop` folder.

Run the following:
```
./DockerDesktop.sh
```

**Note** you may need to run `chmod +x ./DockerDesktop.sh` before executing.

## Next steps.

Check out the `./Next-Steps` dirctory for a structured introduction to Triggermesh components.

Or, if you are a Kubernetes master, jump right in by checking out the `./Triggermesh-Components` directory and start playing right away!


## Known issues / FAQ

- There seems to be a problem with Docker Desktop not releasing port 31080 after tearing down/restarting the cluster.
    Fix: Restart your computer.
