variable "primary_region" {
  description = "The AWS region for the primary VPC"
  type        = string
  default     = "eu-west-1"
}
variable "replica_region" {
  description = "The AWS region for the primary VPC"
  type        = string
  default     = "eu-west-2"
}
