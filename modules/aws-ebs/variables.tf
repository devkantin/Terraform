variable "volume_name" {
  description = "Name of the EBS volume"
  type        = string
  nullable    = false
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  nullable    = false
}

variable "size" {
  description = "Size in GiB"
  type        = number
  default     = 100
}

variable "volume_type" {
  description = "Volume type (gp2, gp3, io1, io2, st1, sc1)"
  type        = string
  default     = "gp3"
}

variable "iops" {
  description = "IOPS"
  type        = number
  default     = 3000
}

variable "throughput" {
  description = "Throughput in MiB/s"
  type        = number
  default     = 125
}

variable "encrypted" {
  description = "Enable encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "instance_id" {
  description = "Instance ID to attach to"
  type        = string
  default     = null
}

variable "device_name" {
  description = "Device name (e.g., /dev/sdf)"
  type        = string
  default     = "/dev/sdf"
}

variable "create_snapshot" {
  description = "Create a snapshot"
  type        = bool
  default     = false
}

variable "snapshot_description" {
  description = "Snapshot description"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
