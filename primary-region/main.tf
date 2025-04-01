module "primary_vpc" {
  source               = "../modules/vpc"
  vpc_name             = "Primary-VPC"
  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["eu-west-1a", "eu-west-1b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

# ASG
module "asg" {
  source            = "../modules/asg"
  asg_name          = "Primary-ASG"
  ami_id            = "ami-12345678" # Replace with a valid AMI
  instance_type     = "t2.micro"
  key_name          = "my-key-pair"
  security_group_id = module.primary_vpc.public_sg_id
  subnet_ids        = module.primary_vpc.public_subnets
  desired_capacity  = 2
  min_size          = 1
  max_size          = 4
}


# ALB
module "alb" {
  source           = "../modules/alb"
  vpc_id           = module.primary_vpc.vpc_id
  public_subnets   = module.primary_vpc.public_subnets
  private_subnets  = module.primary_vpc.private_subnets
  public_sg_id     = module.primary_vpc.alb_security_group_id
  alb_name         = "primary-alb"
  target_group_name = "primary-tg"
  tg_port          = 80
  listener_port    = 80

  # Pass ASG Name (not ASG ID)
  asg_name = module.asg.asg_id
}


module "rds" {
  source                      = "../modules/rds"
  primary_region              = var.primary_region
  replica_region              = var.replica_region
  primary_identifier          = "primary-db"
  replica_identifier          = "replica-db"
  instance_class              = "db.m5.large"
  allocated_storage           = 100
  username                    = "admin"
  password                    = "admin123"
  vpc_security_group_ids      = [module.primary_vpc.rds_security_group_id] # Ensure this output exists
  private_subnet_ids          = module.primary_vpc.private_subnets
  primary_subnet_group_name   = "primary-db-subnet-group"
  replica_subnet_group_name   = "replica-db-subnet-group"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}

