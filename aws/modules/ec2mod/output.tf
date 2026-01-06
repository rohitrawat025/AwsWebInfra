output "instance_id" {
  value = aws_instance.aws_webec2.id
}

output "elastic_ip" {
  value = aws_eip.aws_webeip.public_ip
}

