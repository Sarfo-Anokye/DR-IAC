# Launch Template for EC2 Instances
resource "aws_launch_template" "this" {
  name_prefix   = var.asg_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.asg_name}-Instance"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = var.desired_capacity
  min_size           = var.min_size
  max_size           = var.max_size

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }

  health_check_type          = "EC2"
  health_check_grace_period  = 300

  tag {
    key                 = "Name"
    value               = "${var.asg_name}-Instance"
    propagate_at_launch = true
  }
}
