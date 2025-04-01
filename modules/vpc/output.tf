output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}



output "public_sg_id" {
  description = "The ID of the public security group"
  value       = aws_security_group.public_sg.id
}

output "alb_security_group_id" {
  description = "The security group ID for the ALB"
  value       = aws_security_group.alb_sg.id
}
output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}
