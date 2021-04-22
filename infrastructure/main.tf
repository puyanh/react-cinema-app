provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket  = "app-cinema-tf-state-pu"
    key     = "app-cinema.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Pu Yang"
  }
}
