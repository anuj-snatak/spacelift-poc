variable "region" {
  default = "ap-south-1"   # ← Mumbai
}

variable "environment" {
  default = "poc"
}

variable "bucket_name" {
  type    = string
  default = "spacelift-poc-anuj-bucket-2024"
}
