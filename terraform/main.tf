
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
 
                                                 
// Global Resources

# Resource Group
resource "azurerm_resource_group" "resgrp" {
  name     = local.resgrp
  location = var.location
}

// End of file
