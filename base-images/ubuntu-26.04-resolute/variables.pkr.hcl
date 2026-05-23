variable "qemu_accelerator" {
  type        = string
  default     = ""
  description = "Qemu accelerator to use. On Linux use kvm and macOS use hvf."
}

variable "ubuntu_version" {
  type        = string
  default     = "resolute"
  description = "Ubuntu codename version (i.e. 20.04 is focal, 22.04 is jammy, 24.04 is noble, 26.04 is resolute)"
}

variable "build_directory" {
  type        = string
  default     = "../build/ubuntu-26.04-resolute-base"
  description = "Directory to store the output image"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-26.04-resolute-base.img"
  description = "Name of the output image"
}
