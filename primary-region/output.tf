output "primary_vpc_id" {
  description = "The ID of the primary VPC"
  value       = module.primary_vpc.vpc_id
}

output "primary_public_subnets" {
  description = "Public subnet IDs in the primary VPC"
  value       = module.primary_vpc.public_subnets
}

output "primary_private_subnets" {
  description = "Private subnet IDs in the primary VPC"
  value       = module.primary_vpc.private_subnets
}
