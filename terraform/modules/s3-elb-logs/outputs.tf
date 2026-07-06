output "elb_logs_bucket_name" {
  value = aws_s3_bucket.elb_logs_bucket.bucket
}