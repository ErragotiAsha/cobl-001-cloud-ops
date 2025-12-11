provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "primary_bucket" {
  bucket = "cobl-001-primary-bucket"
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "cobl-001-logs-bucket"
  acl    = "private"
}
