output "bucket_name" {
  value = aws_s3_bucket.poc_bucket.bucket
}

output "instance_id" {
  value = aws_instance.poc_instance.id
}
