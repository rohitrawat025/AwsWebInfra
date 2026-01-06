resource "aws_iam_role" "aws_ec2_s3_log_role1" {
  name = "aws_ec2_s3_log_role1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "aws_s3_log_policy" {
  name = "aws_s3_log_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:PutObject"]
      Resource = "${var.s3_bucket_arn}/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "aws_role_policy_attach" {
  role       = aws_iam_role.aws_ec2_s3_log_role1.name
  policy_arn = aws_iam_policy.aws_s3_log_policy.arn
}

resource "aws_iam_instance_profile" "aws_ec2_profile1" {
  role = aws_iam_role.aws_ec2_s3_log_role1.name
}

