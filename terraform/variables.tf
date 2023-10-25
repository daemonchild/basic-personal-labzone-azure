
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
                                            
// User Variables

variable "project" {
  type        = string
  description = "Project Name - we suggest 'sharedstuff' or similar"
  validation {
    condition     = (length(var.project) <= 20 && length(var.project) > 2 && can(regex("[-\\w\\._\\(\\)]+", var.project)))
    error_message = "Project name may only contain alphanumeric characters, minus and underscores."
  }
  sensitive = false
  nullable  = false
}

variable "dnsdomain" {
  type        = string
  description = "Base domain name for resources (eg: proxy.[project].[whatever.you.put.here])"
  sensitive   = false
  nullable    = false
}

variable "location" {
  type        = string
  description = "Azure location for hosting his project."
  sensitive   = false
  nullable    = false
}

// Get Current Azure User Object
data "azurerm_client_config" "this_azure_client_config" { }
data "azuread_user" "current_azure_user" {
  object_id = data.azurerm_client_config.this_azure_client_config.object_id
}


locals {

  // Do what you want here, but here are some examples
  tags = {
    "project"           = "${var.project}",
    "iac-automation"    = "terraform",
    "status"            = "development",
    "built-by"          = "${data.azuread_user.current_azure_user.display_name}"
  }

}

// The user shouldn't need to change anything below here

locals {
  resgrp = "rg-${lower(var.project)}"

  sas_token_start  = "2023-10-01"           // <---- should be calculated (today, today + 5years?)
  sas_token_expiry = "2028-09-30"

}

// End of file