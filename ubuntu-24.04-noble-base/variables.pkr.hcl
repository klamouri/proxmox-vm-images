variable "qemu_accelerator" {
  type        = string
  default     = ""
  description = "Qemu accelerator to use. On Linux use kvm and macOS use hvf."
}

variable "ubuntu_version" {
  type        = string
  default     = "noble"
  description = "Ubuntu codename version (i.e. 20.04 is focal and 22.04 is jammy)"
}

variable "build_directory" {
  type        = string
  default     = "../build/ubuntu-24.04-noble-base"
  description = "Directory to store the output image"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-24.04-noble-base.img"
  description = "Name of the output image"
}