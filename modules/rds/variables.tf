variable "primary_region" {
  description = "The primary region where the RDS instance will be created."
  type        = string
}

variable "replica_region" {
  description = "The region where the read replica will be created."
  type        = string
}

variable "primary_identifier" {
  description = "The identifier for the primary RDS instance."
  type        = string
}

variable "replica_identifier" {
  description = "The identifier for the read replica RDS instance."
  type        = string
}

variable "instance_class" {
  description = "The instance type for the RDS instances."
  type        = string
  default     = "db.m5.large"
}

variable "allocated_storage" {
  description = "The allocated storage for the RDS instances."
  type        = number
  default     = 100
}

variable "username" {
  description = "The username for the RDS instance."
  type        = string
}

variable "password" {
  description = "The password for the RDS instance."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "The security group IDs to associate with the RDS instance."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "The subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "primary_subnet_group_name" {
  description = "The name of the primary DB subnet group."
  type        = string
}

variable "replica_subnet_group_name" {
  description = "The name of the replica DB subnet group."
  type        = string
}


variable "rds_engine_version" {
  description = "The engine version of the RDS instance."
  type        = string
  default     = "14.3"
}