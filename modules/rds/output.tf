output "primary_rds_endpoint" {
  description = "The endpoint of the primary RDS instance."
  value       = aws_db_instance.primary_postgresql.endpoint
}

output "replica_rds_endpoint" {
  description = "The endpoint of the read replica RDS instance."
  value       = aws_db_instance.replica_postgresql.endpoint
}
