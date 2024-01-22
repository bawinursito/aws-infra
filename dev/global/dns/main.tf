provider "aws" {
  region = "us-west-1"
}



data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "jurassic-park"
    workspaces = {
      name = "dev-us-west-1-vpc"
    }
  }
}

locals {
  vpc_ids            = values(data.terraform_remote_state.vpc.outputs.vpc_ids)
  dns_entry_with_vpc = [for dns in var.dns_entry : merge(dns, dns.private_zone == true ? { vpc = local.vpc_ids } : {})]
}



module "dns" {
  source    = "app.terraform.io/jurassic-park/dns/aws"
  version   = "1.0.3"
  dns_entry = local.dns_entry_with_vpc
}



