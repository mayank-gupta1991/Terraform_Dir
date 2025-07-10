variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = ""
  
}
variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {
    Name = ""
  }
  
}
