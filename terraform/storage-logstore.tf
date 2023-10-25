
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
 
// Storage Configuration for Log Store

// Storage Account, random suffix applied
resource "azurerm_storage_account" "strgacct_logstore" {
    name                        = "salogstore${random_string.random_suffix.result}"
    resource_group_name         = local.resgrp
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    tags = local.tags
    depends_on = [
        azurerm_resource_group.resgrp,
    ]
} 

// Container
resource "azurerm_storage_container" "strgcont_logstore" {

    name                        = "strgcnt-logstore"
    storage_account_name        = azurerm_storage_account.strgacct_logstore.name
    container_access_type       = "private"
    depends_on = [
        azurerm_storage_account.strgacct_logstore,
    ]

}

// End of file


