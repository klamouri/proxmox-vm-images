# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands
### Base Images
- Build Ubuntu base image on macOS: `packer build -var qemu_accelerator=hvf base-images/ubuntu-24.04-noble/ubuntu-24.04-noble.pkr.hcl`
- Build Ubuntu base image on Linux: `packer build -var qemu_accelerator=kvm base-images/ubuntu-24.04-noble/ubuntu-24.04-noble.pkr.hcl`
- Specify different Ubuntu version: `packer build -var ubuntu_version=jammy base-images/ubuntu-24.04-noble/ubuntu-24.04-noble.pkr.hcl`

### Specialized Images
- Build Docker image on macOS: `packer build -var qemu_accelerator=hvf specialized-images/ubuntu-24.04-noble-docker/ubuntu-24.04-noble-docker.pkr.hcl`
- Build Docker image on Linux: `packer build -var qemu_accelerator=kvm specialized-images/ubuntu-24.04-noble-docker/ubuntu-24.04-noble-docker.pkr.hcl`

## Naming Conventions
### Base Images
- Format: `{distribution}-{version}-{codename}`
- Example: `ubuntu-24.04-noble`
- Directory: `base-images/ubuntu-24.04-noble/`
- HCL file: `ubuntu-24.04-noble.pkr.hcl`

### Specialized Images
- Format: `{baseImageName}-{specialization}`
- Example: `ubuntu-24.04-noble-docker` (base: `ubuntu-24.04-noble`, specialization: `docker`)
- Directory: `specialized-images/ubuntu-24.04-noble-docker/`
- HCL file: `ubuntu-24.04-noble-docker.pkr.hcl`

## Code Style Guidelines
- HCL files: Use 2-space indentation
- Ansible: Follow YAML best practices with 2-space indentation
- Shell scripts: Use bash with set -eux for safety
- Variables: Use snake_case for all variable names
- Comments: Use inline comments for non-obvious configuration choices
- Path references: Use relative paths from the project root
- File endings: All files must end with a newline character

## Repository Structure
- `base-images/`: Base VM images with minimal OS setup
  - Follow naming: `{distribution}-{version}-{codename}`
  - Example: `base-images/ubuntu-24.04-noble/`
- `specialized-images/`: Images built on top of base images for specific use cases
  - Follow naming: `{baseImageName}-{specialization}`
  - Example: `specialized-images/ubuntu-24.04-noble-docker/` (extends `ubuntu-24.04-noble`)
- Each image template has its own directory containing: HCL config, ansible playbooks, cloud-init config, and scripts
- Output directories should not be committed to git

## Build Dependencies
- Specialized images depend on base images and are built after base images complete
- When building "ALL", base images are built first, then specialized images
- Base image artifacts are automatically available to specialized image builds
- Individual image builds respect dependency order automatically
