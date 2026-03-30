provider "aws" {
  region = var.region
}

# Latest Amazon Linux 2023 AMI - auto fetch for ap-south-1
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name        = "spacelift-poc"
    Environment = var.environment
    ManagedBy   = "Spacelift"
  }
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Spacelift"
  }
}
