# Proxmox VM Images

This repository contains Packer templates for building VM images that can be imported into Proxmox.

## Available Images

- [ubuntu-24.04-noble-base](./ubuntu-24.04-noble-base) - Ubuntu 24.04 (Noble Numbat) base image

## Prerequisites

- Packer (>= 1.9.0)
- QEMU
- Ansible

## Building Images Locally

```bash
cd ubuntu-24.04-noble-base
packer build .
```

## GitHub Actions

This repository includes GitHub Actions workflows to automate the building and releasing of VM images.

### Manual Workflow Trigger

You can manually trigger the build workflow from the GitHub Actions tab with these parameters:

- **Version**: The release version number (e.g., 0.0.1)
- **Image Name**: The specific image to build or "ALL" to build all available images

The workflow will:
1. Build the specified image(s)
2. Create a GitHub release with the version number
3. Upload the built images as release artifacts