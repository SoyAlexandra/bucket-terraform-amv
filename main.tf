provider "aws" {
region= "us-east-1!
}

resource "aws_s3_bucket" "bucket" {
bucket = "alexandra-terraform-cloud"

tags = {
Name = "alexandra-terraform"
Environment = "Dev"
}
