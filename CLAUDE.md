# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands
- Build Proxmox VM image on macOS: `packer build -var qemu_accelerator=hvf ubuntu-24.04-noble-base/ubuntu-24.04-noble-base.pkr.hcl`
- Build Proxmox VM image on Linux: `packer build -var qemu_accelerator=kvm ubuntu-24.04-noble-base/ubuntu-24.04-noble-base.pkr.hcl`
- Specify different Ubuntu version: `packer build -var ubuntu_version=jammy ubuntu-24.04-noble-base/ubuntu-24.04-noble-base.pkr.hcl`

## Code Style Guidelines
- HCL files: Use 2-space indentation
- Ansible: Follow YAML best practices with 2-space indentation
- Shell scripts: Use bash with set -eux for safety
- Variables: Use snake_case for all variable names
- Comments: Use inline comments for non-obvious configuration choices
- Path references: Use relative paths from the project root

## Repository Structure
- Each VM image template has its own directory
- Template directories contain: HCL config, ansible playbooks, cloud-init config, and scripts
- Output directories should not be committed to git