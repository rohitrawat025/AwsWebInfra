


resource "aws_instance" "aws_webec2" {
  ami                    = "ami-068c0051b15cdb816"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile_name
}

resource "aws_eip" "aws_webeip" {
  domain = "vpc"
}

resource "aws_eip_association" "aws_webeipassoc" {
  instance_id   = aws_instance.aws_webec2.id
  allocation_id = aws_eip.aws_webeip.id
}

