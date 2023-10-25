
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
 
                                                 
// Output Definitions

// Basic Information
output "project_name" {
  value = var.project
  sensitive = false
  description = "Project Name"
}

output "resource_group_name" {
  value = azurerm_resource_group.resgrp.name
  sensitive = false
  description = "Resource Group"
}

// Storage 

output "tfstate_container_name" {
  value = azurerm_storage_container.strgcont_tfstate.name
  sensitive = false
  description = "Container name to use for Terraform state."
}

output "tfstate_container_sas" {
  value = data.azurerm_storage_account_blob_container_sas.strgacct_tfstate_blob_sas.sas
  sensitive = true
  description = "Container SAS token."
}

output "logstore_container_name" {
  value = azurerm_storage_container.strgcont_logstore.name
  sensitive = false
  description = "Container name to use for logging."
}

output "userdata_container_name" {
  value = azurerm_storage_container.strgcont_userdata.name
  sensitive = false
  description = "Container name to use for long term user data."
}

#output "sas_storage_query_string" {
#  value = data.azurerm_storage_account_sas.strgacct_terraform_sas.sas
#  sensitive = true
#}

// DNS 

output "dns_base_domain_name" {
  value = azurerm_dns_zone.dns_base_zone.name
  sensitive = false
  description = "DNS Base Zone domain name"
}

output "dns_azure_dns_servers" {
  value = azurerm_dns_zone.dns_base_zone.name_servers
  sensitive = false
  description = "Azure DNS Servers --> DNS provider config"
}

output "tags_applied" {
  value = local.tags
  sensitive = false
  description = "Value of tags applied to resources."
}

// End of file