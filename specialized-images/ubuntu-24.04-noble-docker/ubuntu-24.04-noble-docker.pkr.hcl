packer {
  required_plugins {
    qemu = {
      version = "~> 1"
      source  = "github.com/hashicorp/qemu"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "qemu" "docker" {
  accelerator      = var.qemu_accelerator
  disk_compression = true
  disk_image       = true
  disk_size        = "15G"
  headless         = true
  # Use the base Ubuntu image as input
  iso_url          = "${var.base_image_path}"
  iso_checksum     = "none"
  output_directory = "${var.build_directory}"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  ssh_password     = "ubuntu"
  ssh_username     = "ubuntu"
  vm_name          = "${var.image_name}"
  qemuargs = [
    ["-m", "4096M"],
    ["-smp", "2"],
    ["-serial", "mon:stdio"],
  ]
}

build {
  sources = ["source.qemu.docker"]

  # Wait for system to be ready
  provisioner "shell" {
    inline = [
      "echo '==> Waiting for system to be ready...'",
      "sleep 30",
      "sudo apt-get update"
    ]
  }

  # Install Docker via Ansible
  provisioner "ansible" {
    playbook_file = "./ansible/docker.yaml"
  }

  # Verify Docker installation
  provisioner "shell" {
    inline = [
      "echo '==> Verifying Docker installation...'",
      "sudo docker --version",
      "sudo docker run hello-world",
      "echo '==> Docker installation verified!'"
    ]
  }

  # Final cleanup
  provisioner "shell" {
    inline = [
      "echo '==> Final cleanup...'",
      "sudo apt-get autoremove -y",
      "sudo apt-get autoclean",
      "sudo rm -rf /tmp/*",
      "sudo rm -rf /var/log/*",
      "history -c"
    ]
  }
}
