provider "aws" {
  region                  = var.region
  shared_credentials_file = pathexpand("~/.aws/credentials")
}

module "staging-state" {
  source      = "../../modules/state"
  environment = var.environment
}

terraform {
  backend "s3" {
    bucket  = "nu-cyber-range"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

module "staging-infrastructure" {
  source      = "../../modules/cyb634infrastructure"
  environment = var.environment
}

