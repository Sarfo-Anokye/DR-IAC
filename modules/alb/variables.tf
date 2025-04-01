variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets for the ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets for the ASG instances"
  type        = list(string)
}

variable "public_sg_id" {
  description = "Security group for the ALB"
  type        = string
}

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "primary-alb"
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
  default     = "primary-tg"
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}


variable "listener_port" {
  description = "Listener port for the ALB"
  type        = number
  default     = 80
}

variable "tg_port" {
  description = "Target group port"
  type        = number
  default     = 80
}

