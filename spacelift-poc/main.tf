provider "aws" {
  region = var.region
}

# S3 Bucket
resource "aws_s3_bucket" "poc_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Spacelift"
  }
}

resource "aws_s3_bucket_versioning" "poc_bucket_versioning" {
  bucket = aws_s3_bucket.poc_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# EC2 Instance
resource "aws_instance" "poc_instance" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 us-east-1
  instance_type = "t2.micro"

  tags = {
    Name        = "spacelift-poc"
    Environment = var.environment
    ManagedBy   = "Spacelift"
  }
}
