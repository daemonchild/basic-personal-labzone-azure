
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
 
// Storage Configuration for Terraform Remote State

// Storage Account, random suffix applied
resource "azurerm_storage_account" "strgacct_tfstate" {

    name                        = "satfstate${random_string.random_suffix.result}"
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
resource "azurerm_storage_container" "strgcont_tfstate" {

    name                        = "strgcnt-tfstate"
    storage_account_name        = azurerm_storage_account.strgacct_tfstate.name
    container_access_type       = "private"
    depends_on = [
        azurerm_storage_account.strgacct_tfstate,
    ]
}

# Genenate Shared Access Signature (SAS) Token for Storage Account
data "azurerm_storage_account_sas" "strgacct_tfstate_sas" {
    connection_string = azurerm_storage_account.strgacct_tfstate.primary_connection_string
    https_only        = true

    start  = local.sas_token_start
    expiry = local.sas_token_expiry

    services {
        blob  = true
        queue = false
        table = false
        file  = false
    }

    resource_types {
        service   = true
        container = true
        object    = true
    }

    permissions {
        read    = true
        write   = true
        delete  = true
        list    = true
        add     = true
        create  = true
        update  = true
        process = true
        filter  = true
        tag     = true
    }
    depends_on = [
        azurerm_storage_account.strgacct_tfstate,
    ]
}

# Genenate SAS Token for Storage Container

data "azurerm_storage_account_blob_container_sas" "strgacct_tfstate_blob_sas" {

    connection_string             = azurerm_storage_account.strgacct_tfstate.primary_connection_string
    container_name                = azurerm_storage_container.strgcont_tfstate.name
    https_only                    = true

    start  = local.sas_token_start
    expiry = local.sas_token_expiry

    permissions {
        read    = true
        write   = true
        delete  = true
        list    = true
        add     = true
        create  = true

    }

    cache_control = "max-age=5"
    content_disposition = "inline"
    content_encoding = "deflate"
    content_language = "en-US"
    content_type = "application/json"
    
    depends_on = [
        azurerm_storage_account.strgacct_tfstate,
    ]
}

// End of file


