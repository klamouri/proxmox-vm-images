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

source "qemu" "ubuntu" {
  accelerator      = var.qemu_accelerator
  cd_files = ["./cloud-init/*"]
  cd_label         = "cidata"
  disk_compression = true
  disk_image       = true
  disk_size        = "10G"
  headless         = true
  iso_checksum     = "file:https://cloud-images.ubuntu.com/${var.ubuntu_version}/current/SHA256SUMS"
  iso_url          = "https://cloud-images.ubuntu.com/${var.ubuntu_version}/current/${var.ubuntu_version}-server-cloudimg-amd64.img"
  output_directory = "${var.build_directory}"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  ssh_password     = "ubuntu"
  ssh_username     = "ubuntu"
  vm_name          = "${var.image_name}"
  qemuargs = [
    ["-m", "2048M"],
    ["-smp", "2"],
    ["-serial", "mon:stdio"],
  ]
}

build {
  sources = ["source.qemu.ubuntu"]

  # wait for cloud-init to successfully finish
  provisioner "shell" {
    inline = [
      "echo '==> Waiting for cloud-init to finish...'",
      "cloud-init status --wait > /dev/null 2>&1",
      "echo '==> Cloud-init finished!'"
    ]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yaml"
  }

  provisioner "shell" {
    // run scripts with sudo, as the default cloud image user is unprivileged
    # execute_command = "echo 'packer' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    scripts = [
      "scripts/install.sh"
    ]
  }

  // NOTE: cleanup.yaml should always be run last, as this performs post-install cleanup tasks
  provisioner "ansible" {
    playbook_file = "./ansible/cleanup.yaml"
  }
}
