


output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnet_id
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "ec2_instance_profile" {
  value = module.iam_ec2_s3_role.instance_profile_name
}

output "ec2_iam_role" {
  value = module.iam_ec2_s3_role.iam_role_name
}

output "ec2_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.elastic_ip
}

output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}


