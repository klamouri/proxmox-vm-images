# Proxmox VM Images

This repository contains Packer templates for building VM images that can be imported into Proxmox.

## Available Images

### Base Images
- [ubuntu-24.04-noble](./base-images/ubuntu-24.04-noble) - Ubuntu 24.04 (Noble Numbat) base image

### Specialized Images
- [ubuntu-24.04-noble-docker](./specialized-images/ubuntu-24.04-noble-docker) - Ubuntu 24.04 with Docker pre-installed

## Prerequisites

- Packer (>= 1.9.0)
- QEMU
- Ansible

## Building Images Locally

### Base Images
```bash
cd base-images/ubuntu-24.04-noble
packer build  .
```

### Specialized Images
```bash
cd specialized-images/ubuntu-24.04-noble-docker
packer build .
```

Note: If your OS supports it you can overrive the QEMU accelerator by overriding the `qemu_accelerator` variable (`packer build -var qemu_accelerator=kvm .`) 

## GitHub Actions

This repository includes GitHub Actions workflows to automate the building and releasing of VM images.

### Manual Workflow Trigger

You can manually trigger the build workflow from the GitHub Actions tab with these parameters:

- **Version**: The release version number (e.g., 0.0.1)
- **Image Name**: The specific image to build or "ALL" to build all available images
  - For base images: `base-images/ubuntu-24.04-noble`
  - For specialized images: `specialized-images/ubuntu-24.04-noble-docker`
  - To build all images: `ALL`

The workflow will:
1. Build the specified image(s)
2. Create a GitHub release with the version number
3. Upload the built images as release artifacts
