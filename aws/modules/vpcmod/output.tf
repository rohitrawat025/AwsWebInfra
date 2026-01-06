



output "vpc_id" {
  value = aws_vpc.aws_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.aws_pubsub.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.aws_pvtsub.id,
    aws_subnet.aws_pvtsub2.id
  ]
}

