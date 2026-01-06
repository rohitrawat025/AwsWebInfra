


resource "aws_s3_bucket" "awslogbuck2025" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "aws_buckversioning" {
  bucket = aws_s3_bucket.awslogbuck2025.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "aws_buckprivateaccess" {
  bucket = aws_s3_bucket.awslogbuck2025.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


