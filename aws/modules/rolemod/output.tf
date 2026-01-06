
output "iam_role_name" {
  value = aws_iam_role.aws_ec2_s3_log_role1.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.aws_ec2_profile1.name
}

