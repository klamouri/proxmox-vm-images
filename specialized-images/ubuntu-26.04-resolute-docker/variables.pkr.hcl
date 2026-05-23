variable "qemu_accelerator" {
  type        = string
  default     = ""
  description = "Qemu accelerator to use. On Linux use kvm and macOS use hvf."
}

variable "base_image_path" {
  type        = string
  default     = "../../build/base-images/ubuntu-26.04-resolute/ubuntu-26.04-resolute.img"
  description = "Path to the base Ubuntu image to use as input"
}

variable "build_directory" {
  type        = string
  default     = "../../build/specialized-images/ubuntu-26.04-resolute-docker"
  description = "Directory to store the output image"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-26.04-resolute-docker.img"
  description = "Name of the output image"
}
