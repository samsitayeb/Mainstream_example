# store terraform state in S3
terraform {
  backend "s3" {
    bucket  = "remote_bucket"
    key     = "example/directory/tfstate"
    region  = "eu-west-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.59"
    }
  }

  required_version = ">= 1.2.0"
}
