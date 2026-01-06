

resource "aws_security_group" "aws_rdssrtgrp" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_sg_id]
  }
}

resource "aws_db_subnet_group" "aws_dbsubnet" {
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "Password123!"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.aws_dbsubnet.name
  vpc_security_group_ids = [aws_security_group.aws_rdssrtgrp.id]
}


