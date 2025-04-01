output "asg_id" {
  description = "Auto Scaling Group ID"
  value       = aws_autoscaling_group.this.id
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.this.id
}
