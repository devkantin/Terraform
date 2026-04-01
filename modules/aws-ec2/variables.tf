variable "ami_id" {
  description = "The ID of the AMI to launch"
  type        = string
  nullable    = false
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
  nullable    = false
}

variable "key_name" {
  description = "The key pair name to use for the instance"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The VPC subnet ID"
  type        = string
  nullable    = false
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = false
}

variable "root_volume_type" {
  description = "The type of root volume"
  type        = string
  default     = "gp3"
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
  default     = 20
}

variable "ebs_encrypted" {
  description = "Whether to enable EBS encryption"
  type        = bool
  default     = true
}

variable "detailed_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to attach"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data to provide when launching the instance"
  type        = string
  default     = ""
}

variable "user_data_base64" {
  description = "Base64 encoded user data"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "depends_on" {
  description = "Dependencies for resource creation"
  type        = list(any)
  default     = []
}
