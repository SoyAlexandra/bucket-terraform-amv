provider "aws" {
region= "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
bucket = "alexandra-terraform-cloud-2"

tags = {
Name = "alexandra-terraform"
Environment = "Dev"
}
}
