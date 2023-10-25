
// Project: Terraform build of a Pentesting Infrastructure
// Author:  Daemonchild
// Purpose: Build an environment for running pentests

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
                            

// versions.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.51.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {

  features {}
}

// End of file