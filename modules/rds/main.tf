
# Create the Primary RDS PostgreSQL instance
resource "aws_db_instance" "primary_postgresql" {
  identifier              = var.primary_identifier
  engine                  = "postgres"
  engine_version          = var.rds_engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_subnet_group_name    = aws_db_subnet_group.primary_subnet_group.name
  multi_az                = true
  storage_type            = "gp2"
  publicly_accessible     = false
  backup_retention_period = 7
  maintenance_window      = "Sun:05:00-Sun:06:00"
  username                = var.username
  password                = var.password
  tags = {
    Name = "primary-postgresql-db"
  }
  vpc_security_group_ids  = var.vpc_security_group_ids
}

# Create the Read Replica in another region

resource "aws_db_instance" "replica_postgresql" {
  provider                    = aws.replica
  identifier                  = var.replica_identifier
  replicate_source_db = aws_db_instance.primary_postgresql.id
  instance_class              = var.instance_class
  publicly_accessible         = false
  db_subnet_group_name        = aws_db_subnet_group.replica_subnet_group.name
  vpc_security_group_ids      = var.vpc_security_group_ids

  tags = {
    Name = "replica-postgresql-db"
  }
}


# Create subnet groups
resource "aws_db_subnet_group" "primary_subnet_group" {
  name        = var.primary_subnet_group_name
  subnet_ids  = var.private_subnet_ids

  tags = {
    Name = "primary-db-subnet-group"
  }
}

resource "aws_db_subnet_group" "replica_subnet_group" {
  name        = var.replica_subnet_group_name
  subnet_ids  = var.private_subnet_ids

  tags = {
    Name = "replica-db-subnet-group"
  }
}
