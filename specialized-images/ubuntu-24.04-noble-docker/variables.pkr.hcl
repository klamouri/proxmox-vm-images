variable "qemu_accelerator" {
  type        = string
  default     = ""
  description = "Qemu accelerator to use. On Linux use kvm and macOS use hvf."
}

variable "base_image_path" {
  type        = string
  default     = "../../build/base-images/ubuntu-24.04-noble/ubuntu-24.04-noble.img"
  description = "Path to the base Ubuntu image to use as input"
}

variable "build_directory" {
  type        = string
  default     = "../../build/specialized-images/ubuntu-24.04-noble-docker"
  description = "Directory to store the output image"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-24.04-noble-docker.img"
  description = "Name of the output image"
}
