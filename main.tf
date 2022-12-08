# remote state is generated on each make init run
terraform {
  backend "s3" {
    region = "us-west-2"
    key = "terraform/states/static-websites/terraform.tfstate"
  }
}

provider "aws" {
    region = var.region
    assume_role {
      role_arn     = "${var.role_arn}"
      session_name = "${var.session_name}-account-setup"
    }
}
