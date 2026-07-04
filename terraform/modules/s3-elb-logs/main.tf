data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "elb_logs" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "elb_logs" {
  bucket = aws_s3_bucket.elb_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "elb_logs" {
  bucket = aws_s3_bucket.elb_logs.id

  rule {
    id     = "expire-old-logs"
    status = "Enabled"

    expiration {
      days = var.log_retention_days
    }
  }
}

resource "aws_s3_bucket_policy" "elb_logs" {
  bucket = aws_s3_bucket.elb_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowELBLogDelivery"
        Effect = "Allow"
        Principal = {
          Service = "logdelivery.elasticloadbalancing.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.elb_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.elb_logs]
}